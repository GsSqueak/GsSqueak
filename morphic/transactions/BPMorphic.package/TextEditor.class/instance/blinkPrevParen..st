parenblinking
blinkPrevParen: aCharacter 
	"Used if not Shout"
	| _gsSqueakTemp_openDelimiter _gsSqueakTemp_closeDelimiter _gsSqueakTemp_level _gsSqueakTemp_string _gsSqueakTemp_here _gsSqueakTemp_hereChar |
	_gsSqueakTemp_string := paragraph string.
	_gsSqueakTemp_here := pointBlock stringIndex.
	_gsSqueakTemp_openDelimiter := aCharacter.
	_gsSqueakTemp_closeDelimiter := '([{'
				at: (')]}' indexOf: _gsSqueakTemp_openDelimiter).
	_gsSqueakTemp_level := 1.
	[_gsSqueakTemp_level > 0
		and: [_gsSqueakTemp_here > 1]]
		whileTrue: [_gsSqueakTemp_hereChar := _gsSqueakTemp_string at: (_gsSqueakTemp_here := _gsSqueakTemp_here - 1).
			_gsSqueakTemp_hereChar = _gsSqueakTemp_closeDelimiter
				ifTrue: [_gsSqueakTemp_level := _gsSqueakTemp_level - 1.
					_gsSqueakTemp_level = 0
						ifTrue: [^ self blinkParenAt: _gsSqueakTemp_here]]
				ifFalse: [_gsSqueakTemp_hereChar = _gsSqueakTemp_openDelimiter
						ifTrue: [_gsSqueakTemp_level := _gsSqueakTemp_level + 1]]]