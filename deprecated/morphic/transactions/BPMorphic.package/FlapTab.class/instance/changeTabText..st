textual tabs
changeTabText: aString 
	| _gsSqueakTemp_label |
	aString isEmptyOrNil
		ifTrue: [^ self].
	_gsSqueakTemp_label := Locale current languageEnvironment class flapTabTextFor: aString in: self.
	_gsSqueakTemp_label isEmptyOrNil
		ifTrue: [^ self].
	self useStringTab: _gsSqueakTemp_label.
	submorphs first delete.
	self
		assumeString: _gsSqueakTemp_label
		font: Preferences standardFlapFont
		orientation: (Flaps orientationForEdge: self edgeToAdhereTo)
		color: nil