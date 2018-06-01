event handling
keyStroke: evt
	"If pane is not full, pass the event to the last submorph,
	assuming it is the most appropriate recipient (!)"

	scroller submorphs last keyStroke: evt