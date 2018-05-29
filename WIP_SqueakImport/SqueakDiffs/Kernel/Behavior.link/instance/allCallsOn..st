*System-Support
allCallsOn: aSymbol
	"Answer a sorted collection of all the methods that call on aSymbol."

	^self systemNavigation allCallsOn: aSymbol from: self.
	