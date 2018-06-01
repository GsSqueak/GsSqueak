event handling
mouseDown: evt
  evt yellowButtonPressed
    ifTrue: [ 
      "First check for option (menu) click"
      ^ self yellowButtonActivity: evt shiftPressed ]	"If pane is not empty, pass the event to the last submorph,
	assuming it is the most appropriate recipient (!)"	"scroller hasSubmorphs
		ifTrue: [scroller submorphs last
				mouseDown: (evt
						transformedBy: (scroller transformFrom: self))]"