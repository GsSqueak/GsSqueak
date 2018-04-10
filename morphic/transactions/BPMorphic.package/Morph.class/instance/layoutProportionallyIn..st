layout
layoutProportionallyIn: newBounds 
	"Layout specific. Apply the given bounds to the receiver."
	| box frame |
	frame := self layoutFrame
				ifNil: [^ self].
	"compute the cell size the receiver has given its layout frame"
	box := frame layout: self bounds in: newBounds.
	box := box topLeft
				extent: (box extent max: self minExtent).
	box = self bounds
		ifTrue: [^ self].
	"no change"
	^ self layoutInBounds: box