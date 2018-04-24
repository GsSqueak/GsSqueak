*SqClasses-*SqClasses-*SqClasses-miscellaneous
squeakErrorFileName
	"Answer the file name used to dump error reports"

	^ Preferences debugLogTimestamp
		ifTrue: ['SqueakDebug-' , Time totalSeconds printString , '.log']
		ifFalse: ['SqueakDebug.log'].
