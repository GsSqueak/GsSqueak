selection
uiIndexFor: modelIndex 
	"The model does not know anything about the receiver's filtering.  Answer the index in my (possibly filtered) list for modelIndex."
	(modelIndex > 0 and: [ self hasFilter ])
		ifTrue:
			[ | selectedItem |
			selectedItem := self getFullList at: modelIndex.
			(list ifNil: [ self getList ]) withIndexDo:
				[ : eachMatchingItem : n | eachMatchingItem = selectedItem ifTrue: [ ^ n ] ].
			^ 0 ]
		ifFalse: [ ^ modelIndex ]