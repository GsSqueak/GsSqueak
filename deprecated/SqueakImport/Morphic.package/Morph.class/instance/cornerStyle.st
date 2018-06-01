rounding
cornerStyle
	"Returns one of the following symbols:
		#square
		#rounded
	according to the current corner style."

	^ self valueOfProperty: #cornerStyle ifAbsent: [#square]