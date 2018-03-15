dropping/grabbing
wantsDroppedMorph: aMorph event: evt 
	"Return true if the receiver wishes to accept the given morph, which is
	being dropped by a hand in response to the given event. The default
	implementation returns false.
	NOTE: the event is assumed to be in global (world) coordinates."
	(aMorph isKindOf: NewHandleMorph)
		ifTrue: [^ false].
	(aMorph isKindOf: GeeBookMorph)
		ifTrue: [^ false].
	"avoid looping"
	^ super wantsDroppedMorph: aMorph event: evt