other
maxBounds
	| rr |
	"fullBounds if all flop-out parts of the paintBox were showing."

	rr := bounds merge: colorMemory bounds.
	rr := rr merge: (self submorphNamed: 'stamps') bounds.
	rr := rr origin corner: rr corner + (0@ (self submorphNamed: 'shapes') height 
				+ 10 "what is showing of (self submorphNamed: #toggleShapes) height").
	^ rr