accessing parallel hierarchy
theNonMetaClass

	^ self isMeta
		ifTrue: [self class
					interface: interface
					named: name
					meta: false
					inEnvironment: environment]
		ifFalse: [self]