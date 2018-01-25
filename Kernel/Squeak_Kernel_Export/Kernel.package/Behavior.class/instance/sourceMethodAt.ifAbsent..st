accessing method dictionary
sourceMethodAt: selector ifAbsent: aBlock
	"Answer the paragraph corresponding to the source code for the 
	argument."

	^ (self sourceCodeAt: selector ifAbsent: [^ aBlock value]) asText makeSelectorBoldIn: self