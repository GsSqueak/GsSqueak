combination rules
partitionedAdd: word1 to: word2 nBits: nBits componentMask: componentMask carryOverflowMask: carryOverflowMask 
	"Add word1 to word2 as nParts partitions of nBits each.
	This is useful for packed pixels, or packed colors"
	"Use unsigned int everywhere because it has a well known arithmetic
	model without undefined behavior w.r.t. overflow and shifts"
	| _gsSqueakTemp_carryOverflow _gsSqueakTemp_sum _gsSqueakTemp_w1 _gsSqueakTemp_w2 |
	<var: #word1 type: 'unsigned int'>
	<var: #word2 type: 'unsigned int'>
	<var: #w1 type: 'unsigned int'>
	<var: #w2 type: 'unsigned int'>
	<var: #componentMask type: 'unsigned int'>
	<var: #carryOverflowMask type: 'unsigned int'>
	<var: #carryOverflow type: 'unsigned int'>
	<var: #sum type: 'unsigned int'>
	_gsSqueakTemp_w1 := word1 bitAnd: carryOverflowMask.
	"mask to remove high bit of each component"
	_gsSqueakTemp_w2 := word2 bitAnd: carryOverflowMask.
	_gsSqueakTemp_sum := (word1 bitXor: _gsSqueakTemp_w1)
				+ (word2 bitXor: _gsSqueakTemp_w2).
	"sum without high bit to avoid overflowing over next component"
	_gsSqueakTemp_carryOverflow := (_gsSqueakTemp_w1 bitAnd: _gsSqueakTemp_w2)
				bitOr: ((_gsSqueakTemp_w1 bitOr: _gsSqueakTemp_w2)
						bitAnd: _gsSqueakTemp_sum).
	"detect overflow condition for saturating"
	^ ((_gsSqueakTemp_sum bitXor: _gsSqueakTemp_w1)
		bitXor: _gsSqueakTemp_w2)
		bitOr: _gsSqueakTemp_carryOverflow >> (nBits - 1) * componentMask"sum high bit without overflow"
	"saturate in case of overflow"