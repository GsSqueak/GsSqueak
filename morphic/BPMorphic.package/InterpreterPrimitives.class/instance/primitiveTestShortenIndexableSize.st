object access primitives
primitiveTestShortenIndexableSize
	"Given an object with indexable pointer fields, reduce the size of the
	indexable fields
	to the requested size. Answer the number of bytes freed, or zero if the
	object cannot
	be shortened."
	| _gsSqueakTemp_array _gsSqueakTemp_newSize _gsSqueakTemp_bytesFreed |
	_gsSqueakTemp_newSize := self stackIntegerValue: 0.
	_gsSqueakTemp_array := self stackValue: 1.
	self pop: argumentCount + 1.
	_gsSqueakTemp_bytesFreed := self shorten: _gsSqueakTemp_array toIndexableSize: _gsSqueakTemp_newSize.
	self pushInteger: _gsSqueakTemp_bytesFreed