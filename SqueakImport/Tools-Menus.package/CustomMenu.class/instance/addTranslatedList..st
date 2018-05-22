construction
addTranslatedList: listOfTuplesAndDashes
	"Add a menu item to the receiver for each tuple in the given list of the form (<what to show> <selector>). Add a line for each dash (-) in the list.  The tuples may have an optional third element, providing balloon help for the item, but such an element is ignored in mvc.
	The first element will be translated."

	listOfTuplesAndDashes do: [:aTuple |
		aTuple == #-
			ifTrue: [self addLine]
			ifFalse: [self add: aTuple first translated action: aTuple second]]

	"CustomMenu new addTranslatedList: #(
		('apples' buyApples)
		('oranges' buyOranges)
		-
		('milk' buyMilk)); startUp"

