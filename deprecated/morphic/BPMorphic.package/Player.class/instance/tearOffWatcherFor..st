slots-user
tearOffWatcherFor: aSlotGetter 
	"Tear off a simple textual watcher for the slot whose getter is provided"
	| _gsSqueakTemp_aWatcher _gsSqueakTemp_anInterface _gsSqueakTemp_info _gsSqueakTemp_isNumeric |
	_gsSqueakTemp_info := self slotInfoForGetter: aSlotGetter.
	_gsSqueakTemp_info
		ifNil: [_gsSqueakTemp_anInterface := Vocabulary eToyVocabulary
						methodInterfaceAt: aSlotGetter
						ifAbsent: [].
			_gsSqueakTemp_isNumeric := _gsSqueakTemp_anInterface notNil
						and: [_gsSqueakTemp_anInterface resultType == #Number]]
		ifNotNil: [_gsSqueakTemp_isNumeric := _gsSqueakTemp_info type == #Number].
	_gsSqueakTemp_aWatcher := UpdatingStringMorph new.
	_gsSqueakTemp_aWatcher growable: true;
		 getSelector: aSlotGetter;
		
		putSelector: (_gsSqueakTemp_info notNil
				ifTrue: [ScriptingSystem setterSelectorForGetter: aSlotGetter]
				ifFalse: [_gsSqueakTemp_anInterface companionSetterSelector]);
		
		setNameTo: (_gsSqueakTemp_info notNil
				ifTrue: [aSlotGetter inherentSelector]
				ifFalse: [_gsSqueakTemp_anInterface wording]);
		 target: self.
	_gsSqueakTemp_isNumeric
		ifTrue: [self setFloatPrecisionFor: _gsSqueakTemp_aWatcher]
		ifFalse: [_gsSqueakTemp_aWatcher useStringFormat].
	_gsSqueakTemp_aWatcher step; fitContents; openInHand