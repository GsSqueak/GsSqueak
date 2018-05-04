version testing
headerNotice
"return a string to be put at the front of generated code files"
	^String streamContents:[:strm|
		strm nextPutAll: 'Smalltalk from ';
			nextPutAll: Smalltalk version;
			nextPutAll: ' with VMMaker ';
			nextPutAll: self versionString;
			nextPutAll: ' translated as C source on'.
		Time dateAndTimeNow do: [:e | strm nextPut: Character space; nextPutAll: e asString]]