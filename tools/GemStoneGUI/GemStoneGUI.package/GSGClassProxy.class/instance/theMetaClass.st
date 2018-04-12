accessing parallel hierarchy
theMetaClass

	^ self isMeta
		ifTrue: [self]
		ifFalse: [self class
					interface: interface
					named: name
					meta: true
					inEnvironment: environment]