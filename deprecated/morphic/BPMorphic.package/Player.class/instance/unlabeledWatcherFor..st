slots-user
unlabeledWatcherFor: aGetter 
	"Answer an unnlabeled readout for viewing a numeric-valued slot of
	mine "
	| _gsSqueakTemp_aWatcher _gsSqueakTemp_info _gsSqueakTemp_anInterface _gsSqueakTemp_watcherWording _gsSqueakTemp_itsType _gsSqueakTemp_vocab _gsSqueakTemp_aSetter |
	_gsSqueakTemp_info := self slotInfoForGetter: aGetter.
	_gsSqueakTemp_info
		ifNil: [_gsSqueakTemp_anInterface := Vocabulary eToyVocabulary
						methodInterfaceAt: aGetter
						ifAbsent: [].
			_gsSqueakTemp_anInterface
				ifNil: [_gsSqueakTemp_itsType := #Unknown.
					_gsSqueakTemp_aSetter := nil]
				ifNotNil: [_gsSqueakTemp_itsType := _gsSqueakTemp_anInterface resultType.
					_gsSqueakTemp_aSetter := _gsSqueakTemp_anInterface companionSetterSelector].
			_gsSqueakTemp_watcherWording := _gsSqueakTemp_anInterface
						ifNil: ['*']
						ifNotNil: [_gsSqueakTemp_anInterface wording]]
		ifNotNil: [_gsSqueakTemp_itsType := _gsSqueakTemp_info type.
			_gsSqueakTemp_watcherWording := aGetter inherentSelector.
			_gsSqueakTemp_aSetter := _gsSqueakTemp_watcherWording asSetterSelector].
	_gsSqueakTemp_vocab := Vocabulary vocabularyForType: _gsSqueakTemp_itsType.
	_gsSqueakTemp_aWatcher := _gsSqueakTemp_vocab
				updatingTileForTarget: self
				partName: _gsSqueakTemp_watcherWording
				getter: aGetter
				setter: _gsSqueakTemp_aSetter.
	_gsSqueakTemp_aWatcher setNameTo: self externalName , '''s ' , _gsSqueakTemp_watcherWording.
	_gsSqueakTemp_aWatcher
		minHeight: (_gsSqueakTemp_vocab wantsArrowsOnTiles
				ifTrue: [22]
				ifFalse: [14]).
	^ _gsSqueakTemp_aWatcher