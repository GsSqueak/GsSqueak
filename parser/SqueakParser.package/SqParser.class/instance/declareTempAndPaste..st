error correction
declareTempAndPaste: name 
	"Defer declaring the temp until the parse has completed. This allows
	the parser to declare the temp in the minimum enclosing block
	instead of always at method level. See
	Parser>>declareUndeclaredTemps:"
	^ encoder bindUndeclaredTemp: name