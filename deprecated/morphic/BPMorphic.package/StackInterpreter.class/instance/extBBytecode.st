miscellaneous bytecodes
extBBytecode
	"225		11100001	sbbbbbbb	Extend B (Ext B = Ext B prev * 256 + Ext B)"
	| _gsSqueakTemp_byte |
	_gsSqueakTemp_byte := self fetchByte.
	self fetchNextBytecode.
	extB := (numExtB = 0
					and: [_gsSqueakTemp_byte > 127])
				ifTrue: [_gsSqueakTemp_byte - 256]
				ifFalse: [(extB bitShift: 8)
						+ _gsSqueakTemp_byte].
	numExtB := numExtB + 1