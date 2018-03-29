utilities
booleanCheatTrueV4
	"cheat the interpreter out of the pleasure of handling the next
	bytecode IFF it is a jump-on-boolean. Which it is, often enough when
	the current bytecode is something like bytecodePrimEqual"
	| _gsSqueakTemp_bytecode _gsSqueakTemp_offset |
	_gsSqueakTemp_bytecode := self fetchByte.
	"assume next bytecode is jumpIfFalse (99%)"
	self internalPop: 2.
	_gsSqueakTemp_bytecode >= 208
		ifTrue: [_gsSqueakTemp_bytecode <= 215
				ifTrue: ["short jumpIfFalse 208 - 215"
					^ self fetchNextBytecode].
			_gsSqueakTemp_bytecode = 244
				ifTrue: ["long jumpIfFalse"
					self fetchByte.
					^ self fetchNextBytecode].
			_gsSqueakTemp_bytecode = 243
				ifTrue: ["long jumpIfTrue 243"
					_gsSqueakTemp_offset := self fetchByte.
					^ self jump: _gsSqueakTemp_offset]].
	"not followed by a jumpIfFalse; (un)do instruction fetch and push
	boolean result"
	self
		cppIf: MULTIPLEBYTECODESETS
		ifTrue: [currentBytecode := _gsSqueakTemp_bytecode + bytecodeSetSelector]
		ifFalse: [currentBytecode := _gsSqueakTemp_bytecode].
	self internalPush: objectMemory trueObject