reading
readData
	"generic data"
	| data nBits nBytes val sample |
	stream binary.
	data := OrderedCollection new.
	nBits := maxValue floorLog:2.
	nBytes := (nBits+1) >> 3.
	(nBits+1 rem: 8) > 0 ifTrue:[nBytes := nBytes+1].

	0 to: rows-1 do: [:y |
		0 to: cols-1 do: [:x |
			val := 0.
			1 to: nBytes do: [:n |
				sample := stream next.
				val := val << 8 + sample.
			].
			data add: val.
		]
	].
	^data

