palette handling
dimTheWindow

	"Updated to use TranslucentColor by kfr 10/5 00"
	"Do not call twice! Installs a morph with an 'onion-skinned' copy of the pixels behind me." 

	"create an 'onion-skinned' version of the stuff on the screen"
	owner outermostMorphThat: [:morph | morph resumeAfterDrawError. false].

	"an experiment for Nebraska to see if opaque background speeds things up"

"----- now using the color variable to control background
	bgColor := false ifTrue: [TranslucentColor r:1.0 g:1.0 b:1.0 alpha:0.5] ifFalse: [Color white].
	dimForm := (RectangleMorph new color: bgColor; bounds: self bounds; borderWidth: 0).
	dimForm position: self position.
	owner
		privateAddMorph: dimForm
		atIndex: (owner submorphs indexOf: self) + 1.
-----"
