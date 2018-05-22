display
viewLocFor: exitedProject 
	"Look for a view of the exitedProject, and return its center"

	world submorphsDo: [:v |
			(v isSystemWindow and: [v model == exitedProject])
				ifTrue: [^ v center]].
	^ super viewLocFor: exitedProject