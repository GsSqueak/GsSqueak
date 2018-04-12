accessing parallel hierarchy
theMetaClass

	^ self isMeta
		ifTrue: [self]
		ifFalse: [self copy isMeta: true]