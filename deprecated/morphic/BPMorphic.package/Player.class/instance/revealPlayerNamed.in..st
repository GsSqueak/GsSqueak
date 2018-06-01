misc
revealPlayerNamed: aSymbol in: aWorld 
	| _gsSqueakTemp_getter |
	_gsSqueakTemp_getter := aSymbol asGetterSelector.
	^ (self perform: _gsSqueakTemp_getter)
		revealPlayerIn: aWorld