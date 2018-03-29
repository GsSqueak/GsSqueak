callback support
positiveMachineIntegerFor: value 
	| _gsSqueakTemp_resultObj |
	objectMemory wordSize = 8
		ifTrue: [_gsSqueakTemp_resultObj := self positive64BitIntegerFor: value]
		ifFalse: [_gsSqueakTemp_resultObj := self positive32BitIntegerFor: value].
	^ _gsSqueakTemp_resultObj