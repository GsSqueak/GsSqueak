specific
dispatchWindowEvent: anEvent with: aMorph 
	"Host window events do not have a position and are only dispatched to
	the World"
	anEvent wasIgnored
		ifTrue: [^ anEvent].
	aMorph isWorldMorph
		ifFalse: [^ #rejected].
	anEvent wasHandled
		ifTrue: [^ anEvent].
	^ aMorph handleEvent: anEvent