action
performAction
	enabled ifFalse:[^self].
	action ifNotNil:[^action value].
	^super performAction