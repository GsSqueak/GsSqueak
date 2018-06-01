metaclasses
theMetaClass

	^ self isMeta
		ifTrue: [self]
		ifFalse: [self copy isMeta: true]