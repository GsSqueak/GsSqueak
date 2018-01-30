events-processing
handleMouseWheel: anEvent 
	"System level event handling."
	anEvent wasHandled
		ifTrue: [^ self].
	(self handlesMouseWheel: anEvent)
		ifFalse: [^ self].
	anEvent wasHandled: true.
	^ self mouseWheel: anEvent