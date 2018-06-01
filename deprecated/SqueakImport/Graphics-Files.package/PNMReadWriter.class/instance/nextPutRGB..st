writing
nextPutRGB: aForm
	| myType f shift mask |
	cols := aForm width.
	rows := aForm height.
	depth := aForm depth.
	f := aForm.
	depth < 16 ifTrue:[
		f := aForm asFormOfDepth: 32.
		depth := 32.
	].
	myType := $6.
	"stream position: 0."
	self writeHeader: myType.
	depth = 32 ifTrue:[shift := 8. mask := 16rFF] ifFalse:[shift := 5. mask := 16r1F].
	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x | | p r g b |
			p := f pixelValueAt: x@y.
			b := p bitAnd: mask. p := p >> shift.
			g := p bitAnd: mask. p := p >> shift.
			r := p bitAnd: mask.
			stream nextPut: r.
			stream nextPut: g.
			stream nextPut: b.
		]
	].
