context stack menu
askForCategoryIn: aClass default: aString
	| categories index category |
	categories := OrderedCollection with: 'new ...'. 
	categories addAll: (aClass allMethodCategoriesIntegratedThrough: Object).	
	index := UIManager default  
				chooseFrom: categories
				title: 'Please provide a good category for the new method!' translated.
	index = 0 ifTrue: [^ aString].
	category := index = 1 ifTrue: [UIManager default request: 'Enter category name:']
						ifFalse: [categories at: index].
	^ category isEmpty ifTrue: [^ aString] ifFalse: [category]