simulation
copyBitsFrom: x0 to: x1 at: y 
	"Simulate the copyBits primitive"
	| _gsSqueakTemp_bb |
	bbObj isInteger
		ifTrue: ["Create a proxy object to handle BitBlt calls"
			_gsSqueakTemp_bb := savedBBObj
						ifNil: [BitBltSimulator new initialiseModule; setInterpreter: interpreterProxy; yourself]
						ifNotNil: [savedBBObj].
			(_gsSqueakTemp_bb loadBitBltFrom: bbObj)
				ifTrue: [bbObj := _gsSqueakTemp_bb]
				ifFalse: [^ self]].
	bbObj
		copyBitsFrom: x0
		to: x1
		at: y