*SqCharacter-object fileIn
storeDataOn: aDataStream
	" Store characters in reference-like way, with value like instvar.
	This is compatible with various Squeak Memory Systems"

	aDataStream
		beginInstance: self class
			size: 1;
		nextPut: self asInteger
