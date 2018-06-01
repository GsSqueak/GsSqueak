viewer
elementTypeFor: aStringOrSymbol vocabulary: aVocabulary 
	"Answer whether aStringOrSymbol is best characterized as a
	#systemSlot, #systemScript, #userSlot, or #userScript. This is
	ancient and odious but too tedious to rip out at this point."
	| _gsSqueakTemp_aSymbol _gsSqueakTemp_anInterface _gsSqueakTemp_aSlotName |
	_gsSqueakTemp_aSymbol := aStringOrSymbol asSymbol.
	_gsSqueakTemp_aSlotName := _gsSqueakTemp_aSymbol inherentSelector.
	(self slotInfo includesKey: _gsSqueakTemp_aSlotName)
		ifTrue: [^ #userSlot].
	(self class isUniClass
			and: [self class scripts includesKey: _gsSqueakTemp_aSymbol])
		ifTrue: [^ #userScript].
	_gsSqueakTemp_anInterface := aVocabulary
				methodInterfaceAt: _gsSqueakTemp_aSymbol
				ifAbsent: [].
	^ _gsSqueakTemp_anInterface
		ifNil: [#systemScript]
		ifNotNil: [_gsSqueakTemp_anInterface resultType == #unknown
				ifTrue: [#systemScript]
				ifFalse: [#systemSlot]]