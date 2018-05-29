organization
category: aString 
	"Categorize the receiver under the system category, aString, removing it from 
	any previous categorization."

	aString isString
		ifTrue: [self environment organization classify: self name under: aString asSymbol ]
		ifFalse: [self errorCategoryName]
