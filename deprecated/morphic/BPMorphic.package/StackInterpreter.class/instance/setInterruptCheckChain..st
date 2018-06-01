primitive support
setInterruptCheckChain: aFunction 
	| _gsSqueakTemp_prevFunction |
	_gsSqueakTemp_prevFunction := interruptCheckChain.
	interruptCheckChain := aFunction.
	^ _gsSqueakTemp_prevFunction