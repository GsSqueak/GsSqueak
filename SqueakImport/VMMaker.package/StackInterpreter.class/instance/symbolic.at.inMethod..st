debug support
symbolic: byte at: ip inMethod: meth
	<doNotGenerate>
	"Print a bytecode in simple symbolic form"

	| type offset |
	type := byte // 16.  
	offset := byte \\ 16.  
	type=0 ifTrue: [^ 'pushRcvr ' , offset printString].
	type=1 ifTrue: [^ 'pushTemp ' , offset printString].
	type=2 ifTrue: [^ 'pushLit ' , offset printString].
	type=3 ifTrue: [^ 'pushLit ' , (offset+16) printString].
	type=4 ifTrue: [^ 'pushLitVar ' , offset printString].
	type=5 ifTrue: [^ 'pushLitVar ' , (offset+16) printString].
	type=6 ifTrue: [offset<8
					ifTrue: [^ 'storePopRcvr ' , offset printString]
					ifFalse: [^ 'storePopTemp ' , (offset-8) printString]].
	type=7 ifTrue: [offset=0 ifTrue: [^ 'pushRcvr'].
				offset<8 ifTrue: [^ 'pushConst ' , ( #(true false nil -1 0 1 2) at: offset) printString].
				offset=8 ifTrue: [^ 'returnSelf'].
				offset<12 ifTrue: [^ 'returnConst ' , ( #(true false nil -1 0 1 2) at: offset-8) printString].
				offset=12 ifTrue: [^ 'returnTop'].
				offset=13 ifTrue: [^ 'blockReturnTop'].
				self cppIf: NewspeakVM
					ifTrue:
						[offset=14 ifTrue: [^ 'sendToDynamicSuperclass'].
						offset=15 ifTrue: [^ 'pushImplicitReceiver']]
					ifFalse: [^ 'unusedBytecode']].
	type=8 ifTrue: [^ self symbolicExtensions: offset at: ip inMethod: meth].
	type=9 ifTrue:  "short jumps"
			[offset<8 ifTrue: [^ 'jump ' , (offset+1) printString].
			^ 'jumpIfFalse ' , (offset-8+1) printString].
	type=10 ifTrue:  "long jumps"
			[offset<8 ifTrue: [^ 'extendedJump'].
			offset<12 ifTrue: [^ 'extendedJumpIfTrue'].
			true ifTrue: [^ 'extendedJumpIfFalse']].
	type=11 ifTrue: [^ 'sendSpl ' , (Smalltalk specialSelectorAt: offset+1)].
	type=12 ifTrue: [^ 'sendSpl ' , (Smalltalk specialSelectorAt: offset+17)].
	type>12 ifTrue: [^ 'send ' , (self stringOf: (self literal: offset ofMethod: meth))]