new flap
newFlapTitled: aString onEdge: anEdge
	"Create a new flap with the given title and place it on the given edge"

	^ self newFlapTitled: aString onEdge: anEdge inPasteUp: self currentWorld
