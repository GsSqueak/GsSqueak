event handling
mouseUp: evt
	"If pane is not full, pass the event to the last submorph,
	assuming it is the most appropriate recipient (!)"
	scroller hasSubmorphs ifTrue:
		[scroller submorphs last mouseUp: (evt transformedBy: (scroller transformFrom: self))]