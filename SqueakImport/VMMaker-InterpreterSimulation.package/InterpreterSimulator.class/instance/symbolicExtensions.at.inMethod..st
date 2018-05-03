debug printing
symbolicExtensions: offset at: ip inMethod: meth
	| type offset2 byte2 byte3 |
	offset <=6 ifTrue: 
		["Extended op codes 128-134"
		byte2 := objectMemory byteAt: ip+1.
		offset <= 2 ifTrue:
			["128-130:  extended pushes and pops"
			type := byte2 // 64.
			offset2 := byte2 \\ 64.
			offset = 0 ifTrue: 
				[type = 0 ifTrue: [^ 'pushRcvr ' , offset2 printString].
				type = 1 ifTrue: [^ 'pushTemp ' , offset2 printString].
				type = 2  ifTrue: [^ 'pushLit ' , (offset2 + 1) printString].
				type = 3 ifTrue: [^ 'pushLitVar ' , (offset2 + 1) printString]].
			offset = 1 ifTrue: 
				[type = 0 ifTrue: [^ 'storeIntoRcvr ' , offset2 printString].
				type = 1 ifTrue: [^ 'storeIntoTemp ' , offset2 printString].
				type = 2 ifTrue: [^ 'illegalStore'].
				type = 3 ifTrue: [^ 'storeIntoLitVar ' , (offset2 + 1) printString]].
			offset = 2 ifTrue: 
				[type = 0 ifTrue: [^ 'storePopRcvr ' , offset2 printString].
				type = 1 ifTrue: [^ 'storePopTemp ' , offset2 printString].
				type = 2 ifTrue: [^ 'illegalStore'].
				type = 3  ifTrue: [^ 'storePopLitVar ' , (offset2 + 1) printString]]].
		"131-134: extended sends"
		offset = 3 ifTrue:  "Single extended send"
			[^ 'send ' , (self stringOf: (self literal: byte2 \\ 32))].
		offset = 4 ifTrue:    "Double extended do-anything"
			[byte3 := objectMemory byteAt: ip+2.
			type := byte2 // 32.
			type = 0 ifTrue: [^ 'send ' , (self stringOf: (self literal: byte3))].
			type = 1 ifTrue: [^ 'superSend ' , (self stringOf: (self literal: byte3))].
			type = 2 ifTrue: [^ 'pushRcvr ' , byte3 printString].
			type = 3 ifTrue: [^ 'pushLit ' , byte3 printString].
			type = 4 ifTrue: [^ 'pushLitVar ' , byte3 printString].
			type = 5 ifTrue: [^ 'storeIntoRcvr ' , byte3 printString].
			type = 6 ifTrue: [^ 'storePopRcvr ' , byte3 printString].
			type = 7 ifTrue: [^ 'storeIntoLitVar ' , byte3 printString]].
		offset = 5 ifTrue:  "Single extended send to super"
			[^ 'superSend ' , (self stringOf: (self literal: byte2 \\ 32))].
		offset = 6 ifTrue:   "Second extended send"
			[^ 'send ' , (self stringOf: (self literal: byte2 \\ 64))]].
	offset = 7 ifTrue: [^ 'doPop'].
	offset = 8 ifTrue: [^ 'doDup'].
	offset = 9 ifTrue: [^ 'pushActiveContext'].
	^ 'unusedBytecode'