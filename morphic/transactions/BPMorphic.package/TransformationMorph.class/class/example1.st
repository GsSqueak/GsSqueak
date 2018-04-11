example
example1
	| _gsSqueakTemp_stringMorph _gsSqueakTemp_transformationMorph |
	_gsSqueakTemp_stringMorph := 'vertical text' asMorph.
	_gsSqueakTemp_transformationMorph := TransformationMorph new asFlexOf: _gsSqueakTemp_stringMorph.
	_gsSqueakTemp_transformationMorph angle: Float pi / 2.
	_gsSqueakTemp_transformationMorph position: 5 @ 5.
	_gsSqueakTemp_transformationMorph openInWorld