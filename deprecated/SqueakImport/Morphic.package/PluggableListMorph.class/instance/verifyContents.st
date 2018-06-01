updating
verifyContents
	"Verify the contents of the receiver, reconstituting if necessary.  Called whenever window is reactivated, to react to possible structural changes.  Also called periodically in morphic if the smartUpdating preference is true"
	| newList existingSelection anIndex oldList |
	oldList := list ifNil: [ #() ].
	newList := self getList.
	oldList = newList ifTrue: [ ^ self ].
	existingSelection :=  oldList at: self selectionIndex ifAbsent: [ nil ].
	self updateList.
	(existingSelection notNil and: [(anIndex := self getFullList indexOf: existingSelection asStringOrText ifAbsent: [nil]) notNil])
		ifTrue:
			[model noteSelectionIndex: anIndex for: getListSelector.
			self selectionIndex: anIndex]
		ifFalse:
			[self changeModelSelection: 0]