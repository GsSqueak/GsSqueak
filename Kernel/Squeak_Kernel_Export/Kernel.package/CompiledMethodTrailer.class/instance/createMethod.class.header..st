creating a method
createMethod: numberOfBytesForAllButTrailer class: aCompiledMethodClass header: headerWord 
	| meth delta |
	encodedData ifNil: [self encode].

	meth := aCompiledMethodClass newMethod: numberOfBytesForAllButTrailer + size header: headerWord.
	"copy the encoded trailer data"
	delta := meth size - size.
	1 to: size do:
		[:i | meth at: delta + i put: (encodedData at: i)].

	^meth