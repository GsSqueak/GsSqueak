drag and drop
acceptDroppingMorph: dropee event: evt inMorph: targetMorph 
	"Return the dropee to its old position, and add a reference to it at the
	cursor point."
	| _gsSqueakTemp_bindingName _gsSqueakTemp_externalName _gsSqueakTemp_reference |
	(dropee isKindOf: TransferMorph)
		ifTrue: [_gsSqueakTemp_reference := dropee passenger.
			_gsSqueakTemp_externalName := dropee passenger className]
		ifFalse: [_gsSqueakTemp_reference := dropee.
			dropee externalName].
	_gsSqueakTemp_externalName := _gsSqueakTemp_externalName isOctetString
				ifTrue: [_gsSqueakTemp_externalName]
				ifFalse: ['a' , _gsSqueakTemp_externalName].
	_gsSqueakTemp_bindingName := _gsSqueakTemp_externalName withFirstCharacterDownshifted , _gsSqueakTemp_reference identityHash printString.
	targetMorph correctSelectionWithString: _gsSqueakTemp_bindingName , ' '.
	(self bindingOf: _gsSqueakTemp_bindingName)
		value: _gsSqueakTemp_reference.
	(dropee isKindOf: TransferMorph)
		ifFalse: [dropee rejectDropMorphEvent: evt].
	^ true"success"