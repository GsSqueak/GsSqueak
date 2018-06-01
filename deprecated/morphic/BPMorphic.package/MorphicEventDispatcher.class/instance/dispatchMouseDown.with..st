specific
dispatchMouseDown: anEvent with: aMorph 
	"Find the appropriate receiver for the event and let it handle it. When
	travelling down the hierarchy a prospective handler for the event is
	installed. This prospective handler can be used by submorphs wishing
	to handle the mouse down for negotiating who the receiver is."
	"Try to get out quickly"
	| _gsSqueakTemp_handler _gsSqueakTemp_lastHandler |
	anEvent wasIgnored
		ifTrue: [^ anEvent"propagate the ignored event"].
	(aMorph fullBounds containsPoint: anEvent position)
		ifFalse: [^ #rejected].
	"In case the mouse wasn't even in the receiver"
	_gsSqueakTemp_lastHandler := anEvent handler.
	"Negotiate and install the actual handler."
	_gsSqueakTemp_handler := aMorph handlerForMouseDown: anEvent.
	_gsSqueakTemp_handler
		ifNotNil: [anEvent handler: _gsSqueakTemp_handler].
	[^ self
		dispatchEvent: anEvent
		withHandler: _gsSqueakTemp_handler
		withMorph: aMorph]
		ensure: [anEvent handler: _gsSqueakTemp_lastHandler]