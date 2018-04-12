initialization
initializeFor: aPlayer 
	| _gsSqueakTemp_aNewDictionary |
	owningPlayer := aPlayer.
	instantiatedUserScriptsDictionary
		ifNil: [^ self].
	_gsSqueakTemp_aNewDictionary := IdentityDictionary new.
	instantiatedUserScriptsDictionary
		associationsDo: [:assoc | _gsSqueakTemp_aNewDictionary
				at: assoc key
				put: (assoc value shallowCopy player: aPlayer)].
	instantiatedUserScriptsDictionary := _gsSqueakTemp_aNewDictionary