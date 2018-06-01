send bytecodes
secondExtendedSendBytecode
	"This replaces the Blue Book double-extended super-send [134],
	which is subsumed by the new double-extended do-anything [132].
	It offers a 2-byte send of 0-3 args for up to 63 literals, for which 
	the Blue Book opcode set requires a 3-byte instruction."
	| _gsSqueakTemp_descriptor |
	_gsSqueakTemp_descriptor := self fetchByte.
	messageSelector := self
				literal: (_gsSqueakTemp_descriptor bitAnd: 63).
	argumentCount := _gsSqueakTemp_descriptor >> 6.
	self normalSend