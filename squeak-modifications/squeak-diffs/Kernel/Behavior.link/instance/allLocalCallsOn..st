*System-Support
allLocalCallsOn: aSymbol
	"Answer a sorted collection of all the methods that call on aSymbol, anywhere in my class hierarchy."

	^self systemNavigation allCallsOn: aSymbol from: self theNonMetaClass