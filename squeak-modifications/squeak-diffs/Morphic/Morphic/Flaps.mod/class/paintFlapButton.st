miscellaneous
paintFlapButton
	"Answer a button to serve as the paint flap"

	| pb oldArgs brush myButton m |
	pb := PaintBoxMorph new submorphNamed: #paint:.
	pb
		ifNil:
			[(brush := Form extent: 16@16 depth: 16) fillColor: Color red]
		ifNotNil:
			[oldArgs := pb arguments.
			brush := oldArgs third.
			brush := brush copy: (2@0 extent: 42@38).
			brush := brush scaledToSize: brush extent // 2].
	myButton := BorderedMorph new.
	myButton color: (Color r: 0.833 g: 0.5 b: 0.0); borderWidth: 2; borderColor: #raised.
	myButton addMorph: (m := brush asMorph lock).
	myButton extent: m extent + (myButton borderWidth + 6).
	m position: myButton center - (m extent // 2).
	^ myButton

