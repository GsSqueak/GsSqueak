initialization
initializeAllButLabel
	super initialize.
	self borderWidth: 1;
		
		color: (Color
				r: 0.4
				g: 0.8
				b: 0.6);
		 borderColor: self color darker;
		 borderStyle: BorderStyle thinGray.
	target := nil.
	actionSelector := #flash.
	arguments := Array empty.
	actWhen := #buttonUp