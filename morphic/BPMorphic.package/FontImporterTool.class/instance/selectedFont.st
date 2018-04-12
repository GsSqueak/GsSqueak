font list
selectedFont
	| _gsSqueakTemp_fontDesc _gsSqueakTemp_font |
	_gsSqueakTemp_fontDesc := self currentSelection.
	_gsSqueakTemp_font := self fontFromFamily: _gsSqueakTemp_fontDesc.
	_gsSqueakTemp_font isFontSet
		ifTrue: [_gsSqueakTemp_font := (self currentParent isNil
							or: [self currentParent = self currentSelection])
						ifTrue: [_gsSqueakTemp_font fontArray anyOne]
						ifFalse: ["we have selected a leaf "
							_gsSqueakTemp_font fontArray
								detect: [:subfont | subfont subfamilyName = _gsSqueakTemp_fontDesc fontname]
								ifNone: [_gsSqueakTemp_font]]].
	^ _gsSqueakTemp_font emphasized: emphasis