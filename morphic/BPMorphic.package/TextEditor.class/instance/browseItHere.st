menu messages
browseItHere
	"Retarget the receiver's window to look at the selected class, if
	appropriate. 3/1/96 sw"
	| _gsSqueakTemp_aSymbol _gsSqueakTemp_foundClass _gsSqueakTemp_b |
	(((_gsSqueakTemp_b := model) isKindOf: Browser)
			and: [_gsSqueakTemp_b couldBrowseAnyClass])
		ifFalse: [^ morph flash].
	model okToChange
		ifFalse: [^ morph flash].
	self selectionInterval isEmpty
		ifTrue: [self selectWord].
	(_gsSqueakTemp_aSymbol := self selectedSymbol) isNil
		ifTrue: [^ morph flash].
	_gsSqueakTemp_foundClass := Smalltalk
				at: _gsSqueakTemp_aSymbol
				ifAbsent: [].
	_gsSqueakTemp_foundClass isNil
		ifTrue: [^ morph flash].
	(_gsSqueakTemp_foundClass isKindOf: Class)
		ifTrue: [model selectSystemCategory: _gsSqueakTemp_foundClass category.
			model
				classListIndex: (model classList indexOf: _gsSqueakTemp_foundClass name)]