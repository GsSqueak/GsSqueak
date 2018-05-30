*Morphic-MorphicExtras-Sound
buttonSound

	| myButton m |

	myButton := RectangleMorph new 
		borderWidth: 1;
		cornerStyle: #rounded;
		borderColor: #raised;
		color: self colorForButtons;
		setBalloonText: 'Change sound volume' translated;
		on: #mouseDown send: #soundDownEvt:morph: to: self;
		on: #mouseStillDown send: #soundStillDownEvt:morph: to: self;
		on: #mouseUp send: #soundUpEvt:morph: to: self;
		yourself.

	myButton addMorph: (m := self speakerIcon lock).
	myButton extent: m extent + (myButton borderWidth + 6).
	m position: myButton center - (m extent // 2).
	^myButton
