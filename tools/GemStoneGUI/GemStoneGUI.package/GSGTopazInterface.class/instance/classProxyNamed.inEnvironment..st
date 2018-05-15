deprecated
classProxyNamed: className inEnvironment: environmentProxy

	| isMeta name |
	isMeta := '* class' match: className.
	name := isMeta 
				ifTrue: [(className allButLast: 6) ]
				ifFalse: [className].
	^ GSGClassProxy 
		interface: self
		named: name
		meta: isMeta
		inEnvironment: environmentProxy