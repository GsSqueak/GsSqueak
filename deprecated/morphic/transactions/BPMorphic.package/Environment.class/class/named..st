instance creation
named: aSymbol 
	| _gsSqueakTemp_symbol |
	_gsSqueakTemp_symbol := aSymbol asSymbol.
	^ Instances
		at: _gsSqueakTemp_symbol
		ifAbsentPut: [self withName: _gsSqueakTemp_symbol]