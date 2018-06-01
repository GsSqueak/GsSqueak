available servers
serverNamed: nameString ifAbsent: aBlock

	^self servers at: nameString asString ifAbsent: aBlock