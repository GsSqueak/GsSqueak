code generation
emitCodeForStorePop: stack encoder: encoder 
	self emitCodeForStore: stack encoder: encoder.
	encoder genPop.
	stack pop: 1