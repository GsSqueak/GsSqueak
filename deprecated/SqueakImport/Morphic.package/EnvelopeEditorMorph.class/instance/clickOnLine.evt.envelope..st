editing
clickOnLine: arg1 evt: arg2 envelope: arg3
	"Reorder the arguments for existing event handlers"
	(arg3 isMorph and:[arg3 eventHandler notNil]) ifTrue:[arg3 eventHandler fixReversedValueMessages].
	^self clickOn: arg1 evt: arg2 from: arg3