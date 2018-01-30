examples
makeStar
	"See the similar example in OpaqueForm"
	| sampleForm pen |
	sampleForm := Form extent: 50 @ 50.
	"Make a form"
	pen := Pen newOnForm: sampleForm.
	pen place: 24 @ 50;
		 turn: 18.
	"Draw a 5-pointed star on it."
	1
		to: 5
		do: [:i | pen go: 19;
				 turn: 72;
				 go: 19;
				 turn: -144].
	^ sampleForm"
	Form makeStar follow: [Sensor cursorPoint]
	while: [Sensor noButtonPressed
	"