combination rules
partitionedMul: word1 with: word2 nBits: nBits nPartitions: nParts 
	"Multiply word1 with word2 as nParts partitions of nBits each.
	This is useful for packed pixels, or packed colors.
	Bug in loop version when non-white background"
	"In C, integer multiplication might answer a wrong value if the
	unsigned values are declared as signed.
	This problem does not affect this method, because the most
	significant bit (i.e. the sign bit) will
	always be zero (jmv)"
	| _gsSqueakTemp_sMask _gsSqueakTemp_product _gsSqueakTemp_result _gsSqueakTemp_dMask |
	_gsSqueakTemp_sMask := maskTable at: nBits.
	"partition mask starts at the right"
	_gsSqueakTemp_dMask := _gsSqueakTemp_sMask << nBits.
	_gsSqueakTemp_result := ((word1 bitAnd: _gsSqueakTemp_sMask)
				+ 1 * ((word2 bitAnd: _gsSqueakTemp_sMask)
					+ 1) - 1 bitAnd: _gsSqueakTemp_dMask)
				>> nBits.
	"optimized first step"
	nParts = 1
		ifTrue: [^ _gsSqueakTemp_result"| sMask product result dMask |
			sMask := maskTable at: nBits. 'partition mask starts at the
			right' dMask := sMask << nBits.
			result := (((word1 bitAnd: sMask)+1) * ((word2 bitAnd:
			sMask)+1) - 1 
			bitAnd: dMask) >> nBits.	'optimized first step'
			nBits to: nBits * (nParts-1) by: nBits do: [:ofs |
			product := (((word1>>ofs bitAnd: sMask)+1) * ((word2>>ofs
			bitAnd: sMask)+1) - 1 bitAnd: dMask).
			result := result bitOr: (product bitAnd: dMask) << (ofs-nBits)].
			^ result"].
	_gsSqueakTemp_product := (word1 >> nBits bitAnd: _gsSqueakTemp_sMask)
				+ 1 * ((word2 >> nBits bitAnd: _gsSqueakTemp_sMask)
					+ 1) - 1 bitAnd: _gsSqueakTemp_dMask.
	_gsSqueakTemp_result := _gsSqueakTemp_result bitOr: _gsSqueakTemp_product.
	nParts = 2
		ifTrue: [^ _gsSqueakTemp_result"| sMask product result dMask |
			sMask := maskTable at: nBits. 'partition mask starts at the
			right' dMask := sMask << nBits.
			result := (((word1 bitAnd: sMask)+1) * ((word2 bitAnd:
			sMask)+1) - 1 
			bitAnd: dMask) >> nBits.	'optimized first step'
			nBits to: nBits * (nParts-1) by: nBits do: [:ofs |
			product := (((word1>>ofs bitAnd: sMask)+1) * ((word2>>ofs
			bitAnd: sMask)+1) - 1 bitAnd: dMask).
			result := result bitOr: (product bitAnd: dMask) << (ofs-nBits)].
			^ result"].
	_gsSqueakTemp_product := (word1 >> (2 * nBits) bitAnd: _gsSqueakTemp_sMask)
				+ 1 * ((word2 >> (2 * nBits) bitAnd: _gsSqueakTemp_sMask)
					+ 1) - 1 bitAnd: _gsSqueakTemp_dMask.
	_gsSqueakTemp_result := _gsSqueakTemp_result bitOr: _gsSqueakTemp_product << nBits.
	nParts = 3
		ifTrue: [^ _gsSqueakTemp_result"| sMask product result dMask |
			sMask := maskTable at: nBits. 'partition mask starts at the
			right' dMask := sMask << nBits.
			result := (((word1 bitAnd: sMask)+1) * ((word2 bitAnd:
			sMask)+1) - 1 
			bitAnd: dMask) >> nBits.	'optimized first step'
			nBits to: nBits * (nParts-1) by: nBits do: [:ofs |
			product := (((word1>>ofs bitAnd: sMask)+1) * ((word2>>ofs
			bitAnd: sMask)+1) - 1 bitAnd: dMask).
			result := result bitOr: (product bitAnd: dMask) << (ofs-nBits)].
			^ result"].
	_gsSqueakTemp_product := (word1 >> (3 * nBits) bitAnd: _gsSqueakTemp_sMask)
				+ 1 * ((word2 >> (3 * nBits) bitAnd: _gsSqueakTemp_sMask)
					+ 1) - 1 bitAnd: _gsSqueakTemp_dMask.
	_gsSqueakTemp_result := _gsSqueakTemp_result bitOr: _gsSqueakTemp_product << (2 * nBits).
	^ _gsSqueakTemp_result"| sMask product result dMask |
	sMask := maskTable at: nBits. 'partition mask starts at the right'
	dMask := sMask << nBits.
	result := (((word1 bitAnd: sMask)+1) * ((word2 bitAnd: sMask)+1) - 1
	bitAnd: dMask) >> nBits.	'optimized first step'
	nBits to: nBits * (nParts-1) by: nBits do: [:ofs |
	product := (((word1>>ofs bitAnd: sMask)+1) * ((word2>>ofs bitAnd:
	sMask)+1) - 1 bitAnd: dMask).
	result := result bitOr: (product bitAnd: dMask) << (ofs-nBits)].
	^ result"