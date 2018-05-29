context stack menu
implementMissingMethod: aMessage inClass: aClass
	^ self
		implementMissingMethod: aMessage
		inClass: aClass
		inCategory: (self askForCategoryIn: aClass default: 'as yet unclassified').