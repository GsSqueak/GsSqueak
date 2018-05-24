keystroke helpers
handleCRStroke: evt

	evt keyValue = 13 ifFalse: [ ^false ].
	selectedItem ifNotNil: [ selectedItem invokeWithEvent: evt ].
	^true