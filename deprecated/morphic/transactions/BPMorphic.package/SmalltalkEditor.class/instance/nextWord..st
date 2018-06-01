private
nextWord: position 
	| _gsSqueakTemp_string _gsSqueakTemp_index _gsSqueakTemp_boundaryCharacters |
	_gsSqueakTemp_string := self string.
	_gsSqueakTemp_index := position - 1.
	[(_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isSeparator]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
	_gsSqueakTemp_boundaryCharacters := ')]}''"|^. 	'.
	((_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
			and: [_gsSqueakTemp_boundaryCharacters
					includes: (_gsSqueakTemp_string at: _gsSqueakTemp_index)])
		ifTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1]
		ifFalse: [[(_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
				and: [(_gsSqueakTemp_boundaryCharacters
						includes: (_gsSqueakTemp_string at: _gsSqueakTemp_index)) not]]
				whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1]].
	^ _gsSqueakTemp_index