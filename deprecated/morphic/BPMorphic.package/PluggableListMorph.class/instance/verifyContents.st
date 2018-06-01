updating
verifyContents
	"Verify the contents of the receiver, reconstituting if necessary. Called
	whenever window is reactivated, to react to possible structural
	changes. Also called periodically in morphic if the smartUpdating
	preference is true"
	| _gsSqueakTemp_newList _gsSqueakTemp_existingSelection _gsSqueakTemp_anIndex _gsSqueakTemp_oldList |
	_gsSqueakTemp_oldList := list
				ifNil: [#()].
	_gsSqueakTemp_newList := self getList.
	_gsSqueakTemp_oldList = _gsSqueakTemp_newList
		ifTrue: [^ self].
	_gsSqueakTemp_existingSelection := _gsSqueakTemp_oldList
				at: self selectionIndex
				ifAbsent: [].
	self updateList.
	(_gsSqueakTemp_existingSelection notNil
			and: [(_gsSqueakTemp_anIndex := self getFullList
							indexOf: _gsSqueakTemp_existingSelection asStringOrText
							ifAbsent: []) notNil])
		ifTrue: [model noteSelectionIndex: _gsSqueakTemp_anIndex for: getListSelector.
			self selectionIndex: _gsSqueakTemp_anIndex]
		ifFalse: [self changeModelSelection: 0]