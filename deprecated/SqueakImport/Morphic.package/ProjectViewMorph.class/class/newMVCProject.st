project window creation
newMVCProject
	"Create an instance of me on a new MVC project (in a SystemWindow)."

	| proj window |
	proj := Project new.
	window := (SystemWindow labelled: proj name) model: proj.
	window
		addMorph: (self on: proj)
		frame: (0@0 corner: 1.0@1.0).
	^ window
