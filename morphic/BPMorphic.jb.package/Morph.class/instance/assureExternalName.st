player
assureExternalName
	| aName |
	^ (aName := self knownName)
		ifNil: [self setNameTo: (aName := self externalName).
			^ aName]