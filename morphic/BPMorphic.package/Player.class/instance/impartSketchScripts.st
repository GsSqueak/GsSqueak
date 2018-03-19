misc
impartSketchScripts
	"Let the user designate another object to which my scripts and code
	should be imparted"
	| _gsSqueakTemp_aMorph |
	Sensor waitNoButton.
	_gsSqueakTemp_aMorph := (Smalltalk at: #'ActiveWorld') chooseClickTarget.
	_gsSqueakTemp_aMorph
		ifNil: [^ self].
	_gsSqueakTemp_aMorph renderedMorph isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph acquirePlayerSimilarTo: self]