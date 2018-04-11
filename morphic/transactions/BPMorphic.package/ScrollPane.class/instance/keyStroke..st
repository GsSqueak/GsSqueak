event handling
keyStroke: evt 
	"If pane is not empty, pass the event to the last submorph,
		assuming it is the most appropriate recipient (!)"
	scroller submorphs last keyStroke: evt