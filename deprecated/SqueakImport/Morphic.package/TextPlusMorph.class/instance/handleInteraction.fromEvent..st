editing
handleInteraction: interactionBlock fromEvent: evt
	
	super handleInteraction: interactionBlock fromEvent: evt.
	(self parentGeeMail ifNil: [^self])
		scrollSelectionIntoView: evt 
		alignTop: false 
		inTextMorph: self.
