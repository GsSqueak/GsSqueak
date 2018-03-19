viewer
infoFor: anElement inViewer: aViewer 
	"The user made a gesture asking for info/menu relating"
	| _gsSqueakTemp_aMenu _gsSqueakTemp_elementType _gsSqueakTemp_aSelector |
	_gsSqueakTemp_elementType := self elementTypeFor: anElement vocabulary: aViewer currentVocabulary.
	_gsSqueakTemp_elementType = #systemSlot | (_gsSqueakTemp_elementType == #userSlot)
		ifTrue: [^ self slotInfoButtonHitFor: anElement inViewer: aViewer].
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_aMenu defaultTarget: self.
	_gsSqueakTemp_aSelector := anElement asSymbol.
	_gsSqueakTemp_elementType == #userScript
		ifTrue: [_gsSqueakTemp_aMenu
				add: 'destroy "' translated , anElement , '"'
				selector: #removeScriptWithSelector:
				argument: _gsSqueakTemp_aSelector.
			_gsSqueakTemp_aMenu
				add: 'rename  "' translated , anElement , '"'
				selector: #renameScript:
				argument: _gsSqueakTemp_aSelector.
			_gsSqueakTemp_aMenu
				add: 'textual scripting pane' translated
				selector: #makeIsolatedCodePaneForSelector:
				argument: _gsSqueakTemp_aSelector.
			_gsSqueakTemp_aSelector numArgs > 0
				ifTrue: [_gsSqueakTemp_aMenu
						add: 'remove parameter' translated
						selector: #ceaseHavingAParameterFor:
						argument: _gsSqueakTemp_aSelector]
				ifFalse: [_gsSqueakTemp_aMenu
						add: 'add parameter' translated
						selector: #startHavingParameterFor:
						argument: _gsSqueakTemp_aSelector.
					_gsSqueakTemp_aMenu
						add: 'button to fire this script' translated
						selector: #tearOffButtonToFireScriptForSelector:
						argument: _gsSqueakTemp_aSelector].
			_gsSqueakTemp_aMenu
				add: 'edit balloon help' translated
				selector: #editDescriptionForSelector:
				argument: _gsSqueakTemp_aSelector].
	_gsSqueakTemp_aMenu
		add: 'show categories....' translated
		target: aViewer
		selector: #showCategoriesFor:
		argument: _gsSqueakTemp_aSelector.
	_gsSqueakTemp_aMenu items isEmpty
		ifTrue: ["Never 0 at the moment because of show categories addition"
			_gsSqueakTemp_aMenu add: 'ok' translated action: nil].
	_gsSqueakTemp_aMenu addTitle: anElement asString , ' (' , _gsSqueakTemp_elementType translated , ')'.
	_gsSqueakTemp_aMenu popUpInWorld: aViewer world