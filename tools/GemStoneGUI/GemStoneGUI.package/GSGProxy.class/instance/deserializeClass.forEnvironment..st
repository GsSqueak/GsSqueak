deserialization
deserializeClass: aString forEnvironment: anEnvironment

	| isMeta name |
	isMeta := '* class' match: aString.
	name := isMeta 
				ifTrue: [(aString allButLast: 6) ]
				ifFalse: [aString].
	^ self classProxyClass 
		interface: self session
		named: name
		meta: isMeta
		inEnvironment: anEnvironment