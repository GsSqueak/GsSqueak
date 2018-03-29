stack bytecodes
pushClosureCopyCopiedValuesBytecode
	"The compiler has pushed the values to be copied, if any. Find
	numArgs and numCopied in the byte following.
	Create a Closure with space for the copiedValues and pop numCopied
	values off the stack into the closure.
	Set numArgs as specified, and set startpc to the pc following the
	block size and jump over that code."
	| _gsSqueakTemp_numArgsNumCopied _gsSqueakTemp_numArgs _gsSqueakTemp_numCopied _gsSqueakTemp_blockSize |
	_gsSqueakTemp_numArgsNumCopied := self fetchByte.
	_gsSqueakTemp_numArgs := _gsSqueakTemp_numArgsNumCopied bitAnd: 15.
	_gsSqueakTemp_numCopied := _gsSqueakTemp_numArgsNumCopied bitShift: -4.
	"Split blockSize := (self fetchByte * 256) + self fetchByte. into two
	because evaluation order in C is undefined."
	_gsSqueakTemp_blockSize := self fetchByte << 8.
	_gsSqueakTemp_blockSize := _gsSqueakTemp_blockSize + self fetchByte.
	self
		pushClosureNumArgs: _gsSqueakTemp_numArgs
		copiedValues: _gsSqueakTemp_numCopied
		blockSize: _gsSqueakTemp_blockSize