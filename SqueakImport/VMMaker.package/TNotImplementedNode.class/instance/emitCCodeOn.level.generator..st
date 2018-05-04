C code generation
emitCCodeOn: aStream level: level generator: aCodeGen
	"Emit a comment only"

	aStream cr; nextPutAll: '/*** ';
		nextPutAll: self printString;
		nextPutAll: ' cannot translate: '; cr;
		nextPutAll: parseNode printString;
		cr; nextPutAll: ' ***/'; cr
