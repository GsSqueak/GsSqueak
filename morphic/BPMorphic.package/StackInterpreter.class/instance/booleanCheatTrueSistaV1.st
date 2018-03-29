utilities
booleanCheatTrueSistaV1
	"cheat the interpreter out of the pleasure of handling the next
	bytecode IFF it is a jump-on-boolean. Which it is, often enough when
	the current bytecode is something like bytecodePrimEqual"
	| _gsSqueakTemp_bytecode _gsSqueakTemp_offset |
	_gsSqueakTemp_bytecode := self fetchByte.
	"assume next bytecode is jumpIfFalse (99%)"
	self internalPop: 2.
	_gsSqueakTemp_bytecode >= 192
		ifTrue: [_gsSqueakTemp_bytecode <= 199
				ifTrue: ["short jumpIfFalse 192 - 199"
					^ self fetchNextBytecode].
			_gsSqueakTemp_bytecode = 239
				ifTrue: ["long jumpIfFalse"
					self fetchByte.
					^ self fetchNextBytecode].
			_gsSqueakTemp_bytecode = 238
				ifTrue: ["long jumpIfTrue 238"
					_gsSqueakTemp_offset := self fetchByte.
					^ self jump: _gsSqueakTemp_offset]].
	"not followed by a jumpIfFalse; (un)do instruction fetch and push
	boolean result"
	self
		cppIf: MULTIPLEBYTECODESETS
		ifTrue: [currentBytecode := _gsSqueakTemp_bytecode + bytecodeSetSelector]
		ifFalse: [currentBytecode := _gsSqueakTemp_bytecode].
	self internalPush: objectMemory trueObject