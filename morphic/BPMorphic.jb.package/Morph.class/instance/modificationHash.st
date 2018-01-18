testing
modificationHash	^ String		streamContents: [:strm | self longPrintOn: strm]		limitedTo: 25