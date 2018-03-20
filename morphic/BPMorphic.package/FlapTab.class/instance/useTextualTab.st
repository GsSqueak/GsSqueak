textual tabs
useTextualTab
	| _gsSqueakTemp_stringToUse _gsSqueakTemp_colorToUse |
	self preserveDetails.
	_gsSqueakTemp_colorToUse := self
				valueOfProperty: #priorColor
				ifAbsent: [Color green muchLighter].
	submorphs notEmpty
		ifTrue: [self removeAllMorphs].
	_gsSqueakTemp_stringToUse := self
				valueOfProperty: #priorWording
				ifAbsent: ['Unnamed Flap' translated].
	self
		assumeString: _gsSqueakTemp_stringToUse
		font: Preferences standardFlapFont
		orientation: self orientation
		color: _gsSqueakTemp_colorToUse