selection
modelIndexFor: selectionIndex 
	"The model does not know anything about the receiver's filtering, so if
	I am filtered, we must determine the correct index by scanning the
	full list in the model."
	^ (selectionIndex > 0
			and: [self hasFilter])
		ifTrue: [list
				ifEmpty: [0]
				ifNotEmpty: [self getFullList
						indexOf: (self getListItem: selectionIndex)]]
		ifFalse: [selectionIndex]