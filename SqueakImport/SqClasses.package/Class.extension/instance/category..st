*SqClasses-organization
category: aString 
	"Categorize the receiver under the system category, aString, removing it from 
	any previous categorization."

	| oldCategory |
	oldCategory := category.
	aString isString
		ifTrue: [
			category := aString asSymbol.
			self environment organization classify: self name under: category ]
		ifFalse: [self errorCategoryName]
