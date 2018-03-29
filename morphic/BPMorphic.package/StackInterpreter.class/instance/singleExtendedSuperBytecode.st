send bytecodes
singleExtendedSuperBytecode
	"Can use any of the first 32 literals for the selector and pass up to 7
	arguments. "
	| _gsSqueakTemp_descriptor |
	_gsSqueakTemp_descriptor := self fetchByte.
	messageSelector := self
				literal: (_gsSqueakTemp_descriptor bitAnd: 31).
	argumentCount := _gsSqueakTemp_descriptor >> 5.
	self superclassSend