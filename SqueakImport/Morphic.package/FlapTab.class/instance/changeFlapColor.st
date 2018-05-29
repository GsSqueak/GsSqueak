menu
changeFlapColor
	(self flapShowing)
		ifTrue:
			[referent changeColor]
		ifFalse:
			[self inform: 'The flap itself needs to be open
before you can change its
color.' translated]