morphic ui
morphicViewFileSelectorForSuffixes: aList 
	"Answer a morphic file-selector tool for the given suffix list."
	
	^self morphicViewFileSelectorForSuffixes: aList directory: self lastSelDir