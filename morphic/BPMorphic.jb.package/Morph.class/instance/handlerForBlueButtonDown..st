meta-actions
handlerForBlueButtonDown: anEvent 
	"Return the (prospective) handler for a mouse down event. The
	handler is temporarily installed and can be used for morphs further
	down the hierarchy to negotiate whether the inner or the outer
	morph should finally handle the event.
	Note: Halos handle blue button events themselves so we will only be
	asked if there is currently no halo on top of us."
	self wantsHaloFromClick
		ifFalse: [^ nil"let outer guy have it"].
	anEvent handler
		ifNil: [^ self"let me have it"].
	anEvent handler isPlayfieldLike
		ifTrue: [^ self"let me have it"].
	"by default exclude playfields"
	anEvent shiftPressed
		ifTrue: [^ self"let me have it"]
		ifFalse: [^ nil"let outer guy have it"]