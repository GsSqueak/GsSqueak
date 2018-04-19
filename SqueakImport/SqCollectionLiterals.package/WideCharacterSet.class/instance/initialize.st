*SqCollectionLiterals-*SqCollectionLiterals-initialize-release
initialize

	map := PluggableDictionary integerDictionary.
	byteArrayMap := ByteArray new: 256.
	self initializeWithLowBits: 8
