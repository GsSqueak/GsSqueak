testing
anyFlapsVisibleIn: aWorld 
	aWorld
		submorphsDo: [:m | (m isKindOf: FlapTab)
				ifTrue: [^ true]].
	^ false