submorphs-add/remove
addMorphFront: aMorph
	"Called by the 'embed' meta action. We want non-atoms to go to the back."
	"Note: A user would not be expected to write this method. However, a sufficiently advanced user (e.g, an e-toy author) might do something equivalent by overridding the drag-n-drop messages when they are implemented."

	(aMorph isMemberOf: AtomMorph)
		ifTrue: [super addMorphFront: aMorph]
		ifFalse: [super addMorphBack: aMorph].