platform specific
isActiveDirectoryClass
	^ super isActiveDirectoryClass
		and: [(Smalltalk getSystemAttribute: 1201) isNil
				or: [(Smalltalk getSystemAttribute: 1201) asNumber <= 31]]