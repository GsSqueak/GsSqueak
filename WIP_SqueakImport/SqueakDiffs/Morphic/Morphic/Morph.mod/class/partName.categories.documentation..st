new-morph participation
partName: aName categories: aList documentation: aDoc
	"Answer a DescriptionForPartsBin which will represent a launch of a new instance of my class via the #newStandAlone protocol sent to my class. Use the category-list and documentation provided"


	^ DescriptionForPartsBin new
		formalName: aName
		categoryList: aList
		documentation: aDoc
		globalReceiverSymbol: self name
		nativitySelector: #newStandAlone