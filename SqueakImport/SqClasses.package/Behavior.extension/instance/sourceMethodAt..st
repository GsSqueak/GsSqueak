*SqClasses-accessing method dictionary
sourceMethodAt: selector 
	"Answer the paragraph corresponding to the source code for the 
	argument."

	^(self sourceCodeAt: selector) asText makeSelectorBoldIn: self
