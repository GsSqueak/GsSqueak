stack bytecodes
extPushFullClosureBytecode
	"255		11111111	xxxxxxxx	siyyyyyy	
	push Closure Compiled block literal index xxxxxxxx (+ Extend A *
	256) 
	numCopied yyyyyy 
	receiverOnStack: s = 1 
	ignoreOuterContext: i = 1
	The compiler has pushed the values to be copied, if any. The receiver
	has been pushed on stack before if specified. 
	Create a Closure with space for the copiedValues and pop numCopied
	values off the stack into the closure.
	Sets outerContext, compiledBlock, numArgs and receiver as
	specified.. "
	| _gsSqueakTemp_compiledBlockLiteralIndex _gsSqueakTemp_compiledBlock _gsSqueakTemp_byte _gsSqueakTemp_numArgs _gsSqueakTemp_numCopied _gsSqueakTemp_receiverIsOnStack _gsSqueakTemp_ignoreContext |
	_gsSqueakTemp_compiledBlockLiteralIndex := self fetchByte + (extA << 8).
	extA := 0.
	_gsSqueakTemp_compiledBlock := self literal: _gsSqueakTemp_compiledBlockLiteralIndex.
	self
		assert: (objectMemory isOopCompiledMethod: _gsSqueakTemp_compiledBlock).
	_gsSqueakTemp_numArgs := self argumentCountOf: _gsSqueakTemp_compiledBlock.
	_gsSqueakTemp_byte := self fetchByte.
	_gsSqueakTemp_numCopied := _gsSqueakTemp_byte bitAnd: 1 << 6 - 1.
	_gsSqueakTemp_receiverIsOnStack := _gsSqueakTemp_byte anyMask: 1 << 7.
	_gsSqueakTemp_ignoreContext := _gsSqueakTemp_byte anyMask: 1 << 6.
	self
		pushFullClosureNumArgs: _gsSqueakTemp_numArgs
		copiedValues: _gsSqueakTemp_numCopied
		compiledBlock: _gsSqueakTemp_compiledBlock
		receiverIsOnStack: _gsSqueakTemp_receiverIsOnStack
		ignoreContext: _gsSqueakTemp_ignoreContext