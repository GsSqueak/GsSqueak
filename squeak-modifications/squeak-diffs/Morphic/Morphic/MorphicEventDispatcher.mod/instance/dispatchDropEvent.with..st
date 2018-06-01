specific
dispatchDropEvent: anEvent with: aMorph
	"Find the appropriate receiver for the event and let it handle it. The dispatch is similar to the default dispatch with one difference: Morphs are given the chance to reject an entire drop operation. If the operation is rejected, no drop will be executed."

	"Try to get out quickly"
	anEvent wasIgnored ifTrue: [^anEvent "propagate the ignored event"].
	(aMorph fullBounds containsPoint: anEvent position) ifFalse:[^#rejected].

	"Give aMorph a chance to repel the dropping morph"
	aMorph rejectDropEvent: anEvent.
	anEvent wasHandled ifTrue:[^anEvent].

	^ self
		dispatchEvent: anEvent
		withHandler: aMorph
		withMorph: aMorph