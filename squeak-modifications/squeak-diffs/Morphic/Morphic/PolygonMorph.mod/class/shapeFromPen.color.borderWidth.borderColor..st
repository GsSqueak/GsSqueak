instance creation
shapeFromPen: penBlock color: c borderWidth: bw borderColor: bc
	"World addMorph: (PolygonMorph
		shapeFromPen: [:p | p hilbert: 4 side: 5. p go: 5.
						p hilbert: 4 side: 5. p go: 5]
		color: Color red borderWidth: 1 borderColor: Color black)"

	| pen |
	penBlock value: (pen := PenPointRecorder new).
	^ (self vertices: pen points asArray color: c borderWidth: bw borderColor: bc)
		quickFill: false