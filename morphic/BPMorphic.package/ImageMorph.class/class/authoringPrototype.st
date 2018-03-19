scripting
authoringPrototype
	| _gsSqueakTemp_aMorph _gsSqueakTemp_aForm |
	_gsSqueakTemp_aMorph := super authoringPrototype.
	_gsSqueakTemp_aForm := ScriptingSystem formAtKey: 'Image'.
	_gsSqueakTemp_aForm
		ifNil: [_gsSqueakTemp_aForm := _gsSqueakTemp_aMorph image rotateBy: 90].
	_gsSqueakTemp_aMorph image: _gsSqueakTemp_aForm.
	^ _gsSqueakTemp_aMorph