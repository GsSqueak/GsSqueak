-Etoys-customevents-custom events
standardEventStati
	"Answer the events that can be directed to a particular morph by its
	event handler."
	"run when mouse goes down on me"
	"while mouse still down"
	"when mouse comes back up"
	"when mouse enters my bounds, button up"
	"when mouse exits my bounds, button up"
	"when mouse enters my bounds, button down"
	"when mouse exits my bounds, button down"
	"keyStroke"
	"gesture"
	^ #(#mouseDown #mouseStillDown #mouseUp #mouseEnter #mouseLeave #mouseEnterDragging #mouseLeaveDragging )