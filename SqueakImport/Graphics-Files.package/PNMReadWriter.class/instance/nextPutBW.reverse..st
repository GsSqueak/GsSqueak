writing
nextPutBW: aForm reverse: flagXor
	| myType val nBytes bytesRow |
	cols := aForm width.
	rows := aForm height.
	depth := aForm depth.
	"stream position: 0."
	aForm depth = 1 ifTrue:[myType := $4] ifFalse:[myType := $5].
	self writeHeader: myType.
	stream binary.
	nBytes := (cols/8) ceiling.
	bytesRow := (cols/32) ceiling * 4.
	0 to: rows-1 do: [:y | | i |
		i := 1 + (bytesRow*y).
		0 to: nBytes-1 do: [:x |
			val := aForm bits byteAt: i.
			flagXor ifTrue:[val := val bitXor: 16rFF].
			stream nextPut: val.
			i := i+1.
		]
	].
