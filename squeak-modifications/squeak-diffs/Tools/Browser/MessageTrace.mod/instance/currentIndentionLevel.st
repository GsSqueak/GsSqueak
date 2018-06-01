private accessing
currentIndentionLevel
	^ messageListIndex isZero ifFalse: [ self indentionLevelAt: messageListIndex ]