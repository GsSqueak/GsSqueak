world state
startSteppingSubmorphsOf: aMorph
	"Ensure that all submorphs of the given morph that want to be stepped are added to the step list.   Typically used after adding a morph to the world."

	self flag: #obsolete. "the intoWorld mechanism in addMorph nowadays takes care of adding submorphs to steplist"

"	aMorph allMorphsDo: [:m |
		aMorph ~~ m & m wantsSteps ifTrue: [
			m arrangeToStartSteppingIn: m world]].
"

