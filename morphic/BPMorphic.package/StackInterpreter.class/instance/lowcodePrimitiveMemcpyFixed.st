inline primitive generated code
lowcodePrimitiveMemcpyFixed
	"Lowcode instruction generator"
	| _gsSqueakTemp_source _gsSqueakTemp_size _gsSqueakTemp_dest |
	_gsSqueakTemp_size := extA.
	_gsSqueakTemp_source := self internalPopStackPointer.
	_gsSqueakTemp_dest := self internalPopStackPointer.
	self
		lowcode_mem: _gsSqueakTemp_dest
		cp: _gsSqueakTemp_source
		y: _gsSqueakTemp_size.
	extA := 0