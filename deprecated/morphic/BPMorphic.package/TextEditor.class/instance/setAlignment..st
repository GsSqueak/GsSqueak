menu messages
setAlignment: aSymbol 
	| _gsSqueakTemp_attr _gsSqueakTemp_interval |
	_gsSqueakTemp_attr := TextAlignment perform: aSymbol.
	_gsSqueakTemp_interval := self encompassLine: self selectionInterval.
	paragraph
		replaceFrom: _gsSqueakTemp_interval first
		to: _gsSqueakTemp_interval last
		with: ((paragraph text copyFrom: _gsSqueakTemp_interval first to: _gsSqueakTemp_interval last)
				addAttribute: _gsSqueakTemp_attr)