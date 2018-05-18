project window creation
newProjectViewInAWindowFor: aProject
	"Return an instance of me on a new Morphic project (in a SystemWindow)."

	| window proj |
	proj := self on: aProject.
	window := (SystemWindow labelled: aProject name) model: aProject.
	window
		addMorph: proj
		frame: (0@0 corner: 1.0@1.0).
	proj borderWidth: 0.
	^ window
