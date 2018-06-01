events-processing
rejectsEvent: anEvent

	scroller submorphs isEmpty ifTrue: [^true].	"something messed up here"
	scroller firstSubmorph isSyntaxMorph ifTrue: [^ super rejectsEvent: anEvent].
	^self visible not		"ignore locked status"