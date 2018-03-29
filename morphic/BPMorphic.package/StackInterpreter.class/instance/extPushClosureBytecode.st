stack bytecodes
extPushClosureBytecode
	"253		11111101 eei i i kkk	jjjjjjjj		Push Closure Num Copied iii (+ Ext A //
	16 * 8) Num Args kkk (+ Ext A \\ 16 * 8) BlockSize jjjjjjjj (+ Ext B *
	256). ee = num extensions.
	The compiler has pushed the values to be copied, if any. Find
	numArgs and numCopied in the byte following.
	Create a Closure with space for the copiedValues and pop numCopied
	values off the stack into the closure.
	Set numArgs as specified, and set startpc to the pc following the
	block size and jump over that code."
	| _gsSqueakTemp_byte _gsSqueakTemp_numArgs _gsSqueakTemp_numCopied _gsSqueakTemp_blockSize |
	_gsSqueakTemp_byte := self fetchByte.
	_gsSqueakTemp_numArgs := (_gsSqueakTemp_byte bitAnd: 7)
				+ (extA \\ 16 * 8).
	_gsSqueakTemp_numCopied := (_gsSqueakTemp_byte >> 3 bitAnd: 7)
				+ (extA // 16 * 8).
	extA := 0.
	_gsSqueakTemp_blockSize := self fetchByte + (extB << 8).
	numExtB := extB := 0.
	self
		pushClosureNumArgs: _gsSqueakTemp_numArgs
		copiedValues: _gsSqueakTemp_numCopied
		blockSize: _gsSqueakTemp_blockSize