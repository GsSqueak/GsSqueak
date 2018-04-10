private
readGraphicContents
	| _gsSqueakTemp_form _gsSqueakTemp_maxExtent _gsSqueakTemp_ext |
	_gsSqueakTemp_form := Form fromFileNamed: self fullName.
	_gsSqueakTemp_maxExtent := lastGraphicsExtent := self availableGraphicsExtent.
	_gsSqueakTemp_ext := _gsSqueakTemp_form extent.
	(_gsSqueakTemp_maxExtent notNil
			and: [_gsSqueakTemp_form extent <= _gsSqueakTemp_maxExtent])
		ifFalse: [_gsSqueakTemp_form := _gsSqueakTemp_form
						magnify: _gsSqueakTemp_form boundingBox
						by: (_gsSqueakTemp_maxExtent x / _gsSqueakTemp_form width min: _gsSqueakTemp_maxExtent y / _gsSqueakTemp_form height) asPoint
						smoothing: 3].
	contents := ('Image extent: ' , _gsSqueakTemp_ext printString) asText
				, (String with: Character cr)
				, (Text
						string: ' '
						attribute: (TextFontReference
								toFont: (FormSetFont new
										fromFormArray: (Array with: _gsSqueakTemp_form)
										asciiStart: Character space asInteger
										ascent: _gsSqueakTemp_form height))).
	brevityState := #graphic.
	^ contents