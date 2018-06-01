application
followObject: anObject
	anObject outboundPointersDo: [:ea |
		(self follow: ea from: anObject)
			ifTrue: [^ true]].
	^ false