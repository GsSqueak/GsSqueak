resources
imageLibrary
	^ ImageLibrary
		ifNil: [ImageLibrary := IdentityDictionary new]