as yet unclassified
exampleWithPictures
	"DataStream exampleWithPictures"
	| file result |
	file := FileStream fileNamed: 'Test-Picture'.
	file binary.
	(DataStream on: file) nextPut: (Form fromUser).
	file close.

	file := FileStream fileNamed: 'Test-Picture'.
	file binary.
	result := (DataStream on: file) next.
	file close.
	result display.
	^ result