initialization
type: eventType readFrom: aStream

	| deltaX deltaY |
	super type: eventType readFrom: aStream.
	aStream skip: 1.
	deltaX := Integer readFrom: aStream.
	aStream skip: 1.
	deltaY := Integer readFrom: aStream.
	aStream skip: 1.
	direction := Integer readFrom: aStream.
	delta := deltaX @ deltaY.
