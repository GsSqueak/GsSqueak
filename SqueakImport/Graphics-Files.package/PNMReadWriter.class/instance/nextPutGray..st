writing
nextPutGray: aForm
	| myType val |
	cols := aForm width.
	rows := aForm height.
	depth := aForm depth.
	"stream position: 0."
	aForm depth = 1 ifTrue:[myType := $4] ifFalse:[myType := $5].
	self writeHeader: myType.
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			val := aForm pixelValueAt: x@y.
			stream nextPut: val.
		]
	].
