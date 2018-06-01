printing
initString
	^ String
		streamContents: [:s | self fullPrintOn: s]