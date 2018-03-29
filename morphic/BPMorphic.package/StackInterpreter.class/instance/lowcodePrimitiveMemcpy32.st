inline primitive generated code
lowcodePrimitiveMemcpy32
	"Lowcode instruction generator"
	| _gsSqueakTemp_source _gsSqueakTemp_dest _gsSqueakTemp_size |
	_gsSqueakTemp_size := self internalPopStackInt32.
	_gsSqueakTemp_source := self internalPopStackPointer.
	_gsSqueakTemp_dest := self internalPopStackPointer.
	self
		lowcode_mem: _gsSqueakTemp_dest
		cp: _gsSqueakTemp_source
		y: _gsSqueakTemp_size