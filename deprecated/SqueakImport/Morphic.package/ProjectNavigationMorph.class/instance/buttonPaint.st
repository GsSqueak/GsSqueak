the buttons
buttonPaint

	| pb oldArgs brush myButton m |

	myButton := self makeButton: '' balloonText: 'Make a painting' translated for: #doNewPainting.
	pb := PaintBoxMorph new submorphNamed: #paint:.
	pb ifNil: [
		(brush := Form extent: 16@16 depth: 16) fillColor: Color red
	] ifNotNil: [
		oldArgs := pb arguments.
		brush := oldArgs third.
		brush := brush copy: (2@0 extent: 42@38).
		brush := brush scaledToSize: brush extent // 2.
	].
	myButton addMorph: (m := brush asMorph lock).
	myButton extent: m extent + (myButton borderWidth + 6).
	m position: myButton center - (m extent // 2).

	^myButton

"brush := (ScriptingSystem formAtKey: 'Painting')."

