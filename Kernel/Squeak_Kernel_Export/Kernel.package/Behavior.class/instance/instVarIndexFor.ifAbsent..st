accessing instances and variables
instVarIndexFor: instVarName ifAbsent: aBlock
	"Answer the index of the named instance variable."
	
	^self allInstVarNames indexOf: instVarName ifAbsent: aBlock