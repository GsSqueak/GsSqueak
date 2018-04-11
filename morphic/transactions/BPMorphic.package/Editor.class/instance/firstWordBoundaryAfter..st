private
firstWordBoundaryAfter: position 
	"If the character at position is whitespace, answer the position of the
	first character after position which is not whitespace.
	If the character at position is not whitespace, answer the position of
	the first character after position which is whitespace."
	| _gsSqueakTemp_string _gsSqueakTemp_index _gsSqueakTemp_atWhitespace |
	_gsSqueakTemp_string := self string.
	_gsSqueakTemp_index := position.
	(_gsSqueakTemp_atWhitespace := (_gsSqueakTemp_string at: _gsSqueakTemp_index) isSeparator)
		ifTrue: ["find next non-separator"
			[_gsSqueakTemp_index <= _gsSqueakTemp_string size
				and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isSeparator]]
				whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1]]
		ifFalse: ["find next separator"
			[_gsSqueakTemp_index <= _gsSqueakTemp_string size
				and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isSeparator not]]
				whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1]].
	^ _gsSqueakTemp_index