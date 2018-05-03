translation
primitiveTableString
	"Interpreter initializePrimitiveTable primitiveTableString"
	| table |
	table := self primitiveTable.
	^ String
		streamContents: [:s | 
			s nextPut: ${.
			table
				withIndexDo: [:primSpec :index | s cr; tab;
					nextPutAll: '/* ';
					nextPutAll: (index - 1) printString;
					nextPutAll: '*/ ';
					nextPutAll: '(void (*)(void))'; "keep this matching the declaration of primitiveTable in Interpreter class>declareCVarsIn:"
					nextPutAll: primSpec;
					nextPut: $,].
			s cr; nextPutAll: ' 0 }']