*SqClasses-*SqClasses-*SqClasses-miscellaneous
logError: errMsg inContext: aContext to: aFilename
	"Log the error message and a stack trace to the given file."

	| ff |
	FileDirectory default deleteFileNamed: aFilename ifAbsent: [].
	(ff := FileStream fileNamed: aFilename) ifNil: [^ self "avoid recursive errors"].

  	ff nextPutAll: errMsg; cr.
	aContext errorReportOn: ff.
	ff close.
