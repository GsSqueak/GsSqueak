private
previousWord: position 
	| _gsSqueakTemp_string _gsSqueakTemp_index _gsSqueakTemp_boundaryCharacters |
	_gsSqueakTemp_string := self string.
	_gsSqueakTemp_index := position.
	"First, get out of whitespace."
	[(_gsSqueakTemp_index between: 2 and: _gsSqueakTemp_string size)
		and: [(_gsSqueakTemp_string at: _gsSqueakTemp_index) isSeparator]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1].
	_gsSqueakTemp_boundaryCharacters := '([{''"|^. 	'.
	"Are we at a boundary character?"
	((_gsSqueakTemp_index between: 2 and: _gsSqueakTemp_string size)
			and: [_gsSqueakTemp_boundaryCharacters
					includes: (_gsSqueakTemp_string at: _gsSqueakTemp_index)])
		ifTrue: ["yes, select it and any following whitespace of this line."
			_gsSqueakTemp_index := _gsSqueakTemp_index - 1]
		ifFalse: ["no, select to the next boundary character"
			[(_gsSqueakTemp_index between: 1 and: _gsSqueakTemp_string size)
				and: [(_gsSqueakTemp_boundaryCharacters
						includes: (_gsSqueakTemp_string at: _gsSqueakTemp_index)) not]]
				whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index - 1]].
	^ _gsSqueakTemp_index + 1