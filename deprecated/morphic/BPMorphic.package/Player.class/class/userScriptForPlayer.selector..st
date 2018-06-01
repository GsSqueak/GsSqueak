scripts
userScriptForPlayer: aPlayer selector: aSelector 
	"Answer the user script for the player (one copy for all instances of the
	uniclass) and selector"
	| _gsSqueakTemp_newEntry _gsSqueakTemp_existingEntry |
	scripts
		ifNil: [scripts := IdentityDictionary new].
	_gsSqueakTemp_existingEntry := scripts
				at: aSelector
				ifAbsent: [].
	"Sorry for all the distasteful isKindOf: and isMemberOf: stuff here, folks;
	it arises out of concern for preexisting content saved on disk from
	earlier stages of this architecture. Someday much of it could be cut
	loose "
	Preferences universalTiles
		ifTrue: [(_gsSqueakTemp_existingEntry isMemberOf: MethodWithInterface)
				ifTrue: [^ _gsSqueakTemp_existingEntry].
			_gsSqueakTemp_newEntry := (_gsSqueakTemp_existingEntry isKindOf: UniclassScript)
						ifTrue: [_gsSqueakTemp_existingEntry as: MethodWithInterface
							"let go of extra stuff if it was UniclassScript"]
						ifFalse: [MethodWithInterface new playerClass: aPlayer class selector: aSelector].
			scripts at: aSelector put: _gsSqueakTemp_newEntry.
			^ _gsSqueakTemp_newEntry]
		ifFalse: [(_gsSqueakTemp_existingEntry isKindOf: UniclassScript)
				ifTrue: [^ _gsSqueakTemp_existingEntry]
				ifFalse: [_gsSqueakTemp_newEntry := UniclassScript new playerClass: self selector: aSelector.
					scripts at: aSelector put: _gsSqueakTemp_newEntry.
					_gsSqueakTemp_existingEntry
						ifNotNil: ["means it is a grandfathered UserScript that
							needs conversion"
							_gsSqueakTemp_newEntry convertFromUserScript: _gsSqueakTemp_existingEntry].
					^ _gsSqueakTemp_newEntry]]