printing
shortPrintString
	"Return a short (but less precise) print string for use where space is tight."

	^String streamContents: [:s | s
		nextPutAll: '(';
		print: self class;
		nextPutAll: ' r: '; print: self red maxDecimalPlaces: 2;
		nextPutAll: ' g: '; print: self green maxDecimalPlaces: 2;
		nextPutAll: ' b: '; print: self blue maxDecimalPlaces: 2;
		nextPutAll: ')']