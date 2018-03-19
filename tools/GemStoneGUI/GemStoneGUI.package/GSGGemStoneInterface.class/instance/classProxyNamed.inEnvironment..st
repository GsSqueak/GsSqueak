proxies
classProxyNamed: className inEnvironment: environmentProxy

	^ ('* class' match: className)
		ifTrue: [GSGMetaclassProxy
					interface: self
					named: (className allButLast: 6) 
					inEnvironment: environmentProxy]
		ifFalse: [GSGClassProxy 
					interface: self
					named: className 
					inEnvironment: environmentProxy]