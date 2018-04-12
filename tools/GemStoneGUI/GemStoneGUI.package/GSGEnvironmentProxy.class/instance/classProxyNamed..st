deserializing
classProxyNamed: className

	| isMeta name |
	isMeta := '* class' match: className.
	name := isMeta 
				ifTrue: [(className allButLast: 6) ]
				ifFalse: [className].
	^ GSGClassProxy 
		interface: self session
		named: name
		meta: isMeta
		inEnvironment: self