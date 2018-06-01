scripts-kernel
renameScript: oldSelector newSelector: newSelector 
	"Rename the given script to have the new selector"
	| _gsSqueakTemp_aUserScript _gsSqueakTemp_anInstantiation |
	oldSelector = newSelector
		ifTrue: [^ self].
	oldSelector numArgs = 0
		ifTrue: [self class
				allSubInstancesDo: [:aPlayer | 
					| itsCostume aDict |
					_gsSqueakTemp_anInstantiation := aPlayer scriptInstantiationForSelector: oldSelector.
					_gsSqueakTemp_anInstantiation
						ifNotNil: [newSelector numArgs = 0
								ifTrue: [_gsSqueakTemp_anInstantiation changeSelectorTo: newSelector].
							aDict := aPlayer costume actorState instantiatedUserScriptsDictionary.
							itsCostume := aPlayer costume renderedMorph.
							itsCostume
								renameScriptActionsFor: aPlayer
								from: oldSelector
								to: newSelector.
							self currentWorld
								renameScriptActionsFor: aPlayer
								from: oldSelector
								to: newSelector.
							aDict removeKey: oldSelector.
							newSelector numArgs = 0
								ifTrue: [aDict at: newSelector put: _gsSqueakTemp_anInstantiation.
									_gsSqueakTemp_anInstantiation assureEventHandlerRepresentsStatus]]]]
		ifFalse: [newSelector numArgs = 0
				ifTrue: [self class
						allSubInstancesDo: [:aPlayer | 
							_gsSqueakTemp_anInstantiation := aPlayer scriptInstantiationForSelector: newSelector.
							_gsSqueakTemp_anInstantiation
								ifNotNil: [_gsSqueakTemp_anInstantiation assureEventHandlerRepresentsStatus]]]].
	_gsSqueakTemp_aUserScript := self class userScriptForPlayer: self selector: oldSelector.
	_gsSqueakTemp_aUserScript renameScript: newSelector fromPlayer: self.
	"updates all script editors, and inserts the new script in my scripts
	directory "
	self class removeScriptNamed: oldSelector.
	((self existingScriptInstantiationForSelector: newSelector) notNil
			and: [newSelector numArgs > 0])
		ifTrue: [self error: 'ouch'].
	self updateAllViewersAndForceToShow: 'scripts'