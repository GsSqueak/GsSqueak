specific
dispatchDefault: anEvent with: aMorph 
	"Dispatch the given event. The event will be passed to the front-most
	visible submorph that contains the position wrt. to the event."
	"Try to get out quickly"
	anEvent wasIgnored
		ifTrue: [^ anEvent"propagate the ignored event"].
	(aMorph fullBounds containsPoint: anEvent position)
		ifFalse: [^ #rejected].
	^ self
		dispatchEvent: anEvent
		withHandler: aMorph
		withMorph: aMorph