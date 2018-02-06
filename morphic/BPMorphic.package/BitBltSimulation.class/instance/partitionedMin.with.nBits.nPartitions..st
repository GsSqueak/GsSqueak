combination rules
partitionedMin: word1 with: word2 nBits: nBits nPartitions: nParts 
	"Min word1 to word2 as nParts partitions of nBits each"
	"In C, most arithmetic operations answer the same bit pattern
	regardless of the operands being signed or unsigned ints
	(this is due to the way 2's complement numbers work). However,
	comparisions might fail. Add the proper declaration of
	words as unsigned int in those cases where comparisions are done
	(jmv) "
	| _gsSqueakTemp_mask _gsSqueakTemp_result |
	<var: #word1 type: 'unsigned int'>
	<var: #word2 type: 'unsigned int'>
	<var: #mask type: 'unsigned int'>
	<var: #result type: 'unsigned int'>
	_gsSqueakTemp_mask := maskTable at: nBits.
	"partition mask starts at the right"
	_gsSqueakTemp_result := 0.
	1
		to: nParts
		do: [:i | 
			_gsSqueakTemp_result := _gsSqueakTemp_result
						bitOr: ((word2 bitAnd: _gsSqueakTemp_mask)
								min: (word1 bitAnd: _gsSqueakTemp_mask)).
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << nBits
			"slide left to next partition"].
	^ _gsSqueakTemp_result