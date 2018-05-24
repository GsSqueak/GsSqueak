editing
dropVertex: arg1 fromHandle: arg2 vertIndex: arg3
	"Reorder the arguments for existing event handlers"
	(arg3 isMorph and:[arg3 eventHandler notNil]) ifTrue:[arg3 eventHandler fixReversedValueMessages].
	^self dropVertex: arg1 event: arg2 fromHandle: arg3