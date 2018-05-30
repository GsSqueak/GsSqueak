menu messages
browseItHere
	"Retarget the receiver's window to look at the selected class, if appropriate.  3/1/96 sw"
	| aSymbol foundClass b |
	(((b := model) isKindOf: Browser) and: [b couldBrowseAnyClass])
		ifFalse: [^ morph flash].
	model okToChange ifFalse: [^ morph flash].
	self selectionInterval isEmpty ifTrue: [self selectWord].
	(aSymbol := self selectedSymbol) isNil ifTrue: [^ morph flash].

	foundClass := (Smalltalk at: aSymbol ifAbsent: [nil]).
		foundClass isNil ifTrue: [^ morph flash].
		(foundClass isKindOf: Class)
			ifTrue:
				[model selectSystemCategory: foundClass category.
	model classListIndex: (model classList indexOf: foundClass name)]