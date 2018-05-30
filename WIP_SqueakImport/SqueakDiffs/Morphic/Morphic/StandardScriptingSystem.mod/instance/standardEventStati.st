*Morphic-Etoys-customevents-custom events
standardEventStati
	"Answer the events that can be directed to a particular morph by its event handler."
	#('mouseDown'
	  'mouseStillDown' 
	  'mouseUp'
	  'mouseEnter'
	  'mouseLeave'
	  'mouseEnterDragging'
	  'mouseLeaveDragging') translatedNoop.
	^ #( mouseDown	 "run when mouse goes down on me"
		mouseStillDown	"while mouse still down"
		mouseUp "when mouse comes back up"
		mouseEnter 	"when mouse enters my bounds, button up"
		mouseLeave  	"when mouse exits my bounds, button up"
		mouseEnterDragging 	"when mouse enters my bounds, button down"
		mouseLeaveDragging 	"when mouse exits my bounds, button down"
		"keyStroke"
		"gesture"
	)
