proxy creation
classProxyNamed: className

	^ ('* class' match: className)
		ifTrue: [GSGMetaclassProxy
					interface: self session
					named: (className allButLast: 6) 
					inEnvironment: self]
		ifFalse: [GSGClassProxy 
					interface: self session
					named: className 
					inEnvironment: self]