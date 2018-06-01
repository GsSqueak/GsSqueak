scripts-kernel
slotInfoButtonHitFor: aGetterSymbol inViewer: aViewer 
	"The user made a gesture asking for slot menu for the given getter
	symbol in a viewer; put up the menu."
	| _gsSqueakTemp_aMenu _gsSqueakTemp_slotSym _gsSqueakTemp_aType _gsSqueakTemp_typeVocab _gsSqueakTemp_interface _gsSqueakTemp_selector |
	(#(#+ #- #* #/ ) includes: aGetterSymbol)
		ifTrue: [^ self inform: aGetterSymbol , ' is used for vector operations'].
	_gsSqueakTemp_slotSym := aGetterSymbol inherentSelector.
	_gsSqueakTemp_aType := self typeForSlotWithGetter: aGetterSymbol asSymbol.
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_interface := aViewer currentVocabulary
				methodInterfaceAt: aGetterSymbol
				ifAbsent: [].
	_gsSqueakTemp_selector := _gsSqueakTemp_interface isNil
				ifTrue: [_gsSqueakTemp_slotSym asString]
				ifFalse: [_gsSqueakTemp_interface selector].
	_gsSqueakTemp_aMenu addTitle: _gsSqueakTemp_selector , ' (' , _gsSqueakTemp_aType asString translated , ')'.
	_gsSqueakTemp_aType = #Patch
		ifTrue: [_gsSqueakTemp_aMenu
				add: 'grab morph' translated
				target: (self perform: aGetterSymbol)
				selector: #grabPatchMorph
				argument: #().
			_gsSqueakTemp_aMenu addLine].
	(_gsSqueakTemp_typeVocab := Vocabulary vocabularyForType: _gsSqueakTemp_aType) addWatcherItemsToMenu: _gsSqueakTemp_aMenu forGetter: aGetterSymbol.
	(self slotInfo includesKey: _gsSqueakTemp_slotSym)
		ifTrue: [_gsSqueakTemp_aMenu
				add: 'change value type' translated
				selector: #chooseSlotTypeFor:
				argument: aGetterSymbol.
			_gsSqueakTemp_typeVocab addUserSlotItemsTo: _gsSqueakTemp_aMenu slotSymbol: _gsSqueakTemp_slotSym.
			_gsSqueakTemp_aMenu
				add: ('remove "{1}"' translated format: {_gsSqueakTemp_slotSym})
				selector: #removeSlotNamed:
				argument: _gsSqueakTemp_slotSym.
			_gsSqueakTemp_aMenu
				add: ('rename "{1}"' translated format: {_gsSqueakTemp_slotSym})
				selector: #renameSlot:
				argument: _gsSqueakTemp_slotSym.
			_gsSqueakTemp_aMenu addLine].
	_gsSqueakTemp_typeVocab addExtraItemsToMenu: _gsSqueakTemp_aMenu forSlotSymbol: _gsSqueakTemp_slotSym.
	"e.g. Player type adds hand-me-tiles"
	_gsSqueakTemp_aMenu
		add: 'show categories....' translated
		target: aViewer
		selector: #showCategoriesFor:
		argument: aGetterSymbol.
	self addIdiosyncraticMenuItemsTo: _gsSqueakTemp_aMenu forSlotSymol: _gsSqueakTemp_slotSym.
	_gsSqueakTemp_aMenu items isEmpty
		ifTrue: [_gsSqueakTemp_aMenu add: 'ok' translated action: #yourself].
	_gsSqueakTemp_aMenu popUpForHand: aViewer primaryHand in: aViewer world