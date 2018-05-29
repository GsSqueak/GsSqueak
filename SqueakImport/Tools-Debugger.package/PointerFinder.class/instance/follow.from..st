application
follow: anObject from: parentObject 
	anObject == goal ifTrue:
		[ parents
			at: anObject
			put: parentObject.
		^ true ].
	anObject shouldFollowOutboundPointers ifFalse: [ ^ false ].
	((parents includesKey: anObject) or: [ anObject class = self class ]) ifTrue: [ ^ false ].
	parents
		at: anObject
		put: parentObject.
	toDoNext add: anObject.
	^ false