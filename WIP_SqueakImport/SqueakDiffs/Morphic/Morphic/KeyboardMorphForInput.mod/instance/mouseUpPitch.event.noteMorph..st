simple keyboard
mouseUpPitch: pitch event: event noteMorph: noteMorph
	noteMorph color: ((#(0 1 3 5 6 8 10) includes: pitch\\12)
					ifTrue: [whiteKeyColor]
					ifFalse: [blackKeyColor]).
