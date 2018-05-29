server groups
groupName

	^group
		ifNil: [self moniker]
		ifNotNil: [
			(group isString)
				ifTrue: [group]
				ifFalse: [group key]]