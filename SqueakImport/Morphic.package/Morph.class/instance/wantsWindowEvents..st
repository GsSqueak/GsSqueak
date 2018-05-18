event handling
wantsWindowEvents: anEvent
	"Return true if the receiver wants to process host window events. These are only dispatched to the World anyway, but one could have an eventListener in the Hand or a windowEventHandler in the World"
	^false