as yet unclassified
symbolValue: aSymbol 
	"look-up for the value bound to aSymbol"
	^ self symbolValues
		at: aSymbol
		ifAbsent: [upperBindings symbolValue: aSymbol]