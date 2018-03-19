misc
adoptScriptsFrom
	"Let the user click on another object form which the receiver should
	obtain scripts and code"
	| _gsSqueakTemp_aMorph |
	Sensor waitNoButton.
	_gsSqueakTemp_aMorph := (Smalltalk at: #'ActiveWorld') chooseClickTarget.
	_gsSqueakTemp_aMorph
		ifNil: [^ Beeper beep].
	((_gsSqueakTemp_aMorph isSketchMorph
				and: [_gsSqueakTemp_aMorph player belongsToUniClass])
			and: [self belongsToUniClass not])
		ifTrue: [costume acquirePlayerSimilarTo: _gsSqueakTemp_aMorph player]
		ifFalse: [Beeper beep]