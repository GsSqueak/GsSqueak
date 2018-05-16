private
preference: prefName category: categoryName description: helpString type: typeSymbol
	"Create a preference for a preference pragma in a method."
	
	^ self 
		preference: prefName
		categoryList: (categoryName isArray "Alas pragma users are not always careful"
						ifTrue: [categoryName]
						ifFalse: [{categoryName}])
		description: helpString
		type: typeSymbol