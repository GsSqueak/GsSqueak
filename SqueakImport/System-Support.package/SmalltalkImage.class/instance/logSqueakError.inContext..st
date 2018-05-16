miscellaneous
logSqueakError: errMsg inContext: aContext 
	"Log the error message and a stack trace to the usual file."

	^self logError: errMsg inContext: aContext to: self squeakErrorFileName
