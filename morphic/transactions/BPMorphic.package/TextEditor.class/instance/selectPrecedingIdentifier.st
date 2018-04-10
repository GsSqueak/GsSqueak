new selection
selectPrecedingIdentifier
	"Invisibly select the identifier that ends at the end of the selection, if
	any. "
	| _gsSqueakTemp_string _gsSqueakTemp_sep _gsSqueakTemp_stop _gsSqueakTemp_tok |
	_gsSqueakTemp_tok := false.
	_gsSqueakTemp_string := paragraph string.
	_gsSqueakTemp_stop := self stopIndex - 1.
	[_gsSqueakTemp_stop > 0
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_stop) isSeparator]]
		whileTrue: [_gsSqueakTemp_stop := _gsSqueakTemp_stop - 1].
	_gsSqueakTemp_sep := _gsSqueakTemp_stop.
	[_gsSqueakTemp_sep > 0
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_sep) tokenish]]
		whileTrue: [_gsSqueakTemp_tok := true.
			_gsSqueakTemp_sep := _gsSqueakTemp_sep - 1].
	_gsSqueakTemp_tok
		ifTrue: [self selectInvisiblyFrom: _gsSqueakTemp_sep + 1 to: _gsSqueakTemp_stop]