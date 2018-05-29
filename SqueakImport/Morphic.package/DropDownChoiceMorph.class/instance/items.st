accessing
items
	(target notNil and: [getItemsSelector notNil])
		ifTrue: [items := target perform: getItemsSelector withArguments: getItemsArgs].
	items ifNil: [items := #()].
	^items