textual tabs
changeTabText: aString 

	| label |
	aString isEmptyOrNil ifTrue: [^ self].
	label := Locale current languageEnvironment class flapTabTextFor: aString in: self.
	label isEmptyOrNil ifTrue: [^ self].
	self useStringTab: label.
	submorphs first delete.
	self assumeString: label
		font: Preferences standardFlapFont
		orientation: (Flaps orientationForEdge: self edgeToAdhereTo)
		color: nil.
