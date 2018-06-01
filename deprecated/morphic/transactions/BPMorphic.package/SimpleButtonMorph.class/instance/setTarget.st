menu
setTarget
	| _gsSqueakTemp_newLabel |
	_gsSqueakTemp_newLabel := UIManager default request: 'Enter an expression that create the target' translated initialAnswer: 'World'.
	_gsSqueakTemp_newLabel isEmpty
		ifFalse: [self
				target: (Compiler evaluate: _gsSqueakTemp_newLabel)]