public access
parseArgsAndTemps: aString 
	"Parse the argument, aString, answer nil if an error occurs. Otherwise, 
	answer an Array of strings (the argument names and temporary
	variable names)."
	aString == nil
		ifTrue: [^ #()].
	doitFlag := false.
	"Don't really know if a doit or not!"
	^ self
		initPattern: aString
		return: [:pattern | (pattern at: 2)
				, (self
						temporariesIn: (pattern at: 1))]