specific
dispatchMouseDown: anEvent with: aMorph
	"Find the appropriate receiver for the event and let it handle it. When travelling down the hierarchy a prospective handler for the event is installed. This prospective handler can be used by submorphs wishing to handle the mouse down for negotiating who the receiver is."
	
	| handler lastHandler |
	
	"Try to get out quickly"
	anEvent wasIgnored ifTrue: [^anEvent "propagate the ignored event"].
	(aMorph fullBounds containsPoint: anEvent position) ifFalse:[^#rejected].

	"In case the mouse wasn't even in the receiver"
	lastHandler := anEvent handler. 

	"Negotiate and install the actual handler."
	handler := aMorph handlerForMouseDown: anEvent.
	handler ifNotNil: [anEvent handler: handler].

	[^ self
		dispatchEvent: anEvent
		withHandler: handler
		withMorph: aMorph
	] ensure: [
		anEvent handler: lastHandler. "good style"].