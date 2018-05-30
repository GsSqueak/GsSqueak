*Morphic-MorphicExtras-event handling
pauseEventRecorderIn: aWorld
	"Suspend any recorder prior to a project change, and return it.
	It will be resumed after starting the new project."
	eventListeners ifNil:[^nil].
	eventListeners do:
		[:er | (er isKindOf: EventRecorderMorph) ifTrue: [^ er pauseIn: aWorld]].
	^ nil