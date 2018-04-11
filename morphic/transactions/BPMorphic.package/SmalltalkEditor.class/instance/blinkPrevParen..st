parenblinking
blinkPrevParen: aCharacter 
	"Same as super, but tries to follow the Smalltalk syntax."
	| _gsSqueakTemp_openDelimiter _gsSqueakTemp_closeDelimiter _gsSqueakTemp_level _gsSqueakTemp_string _gsSqueakTemp_here _gsSqueakTemp_inside |
	_gsSqueakTemp_string := paragraph text string.
	_gsSqueakTemp_here := pointBlock stringIndex.
	_gsSqueakTemp_openDelimiter := aCharacter.
	_gsSqueakTemp_closeDelimiter := '([{'
				at: (')]}' indexOf: _gsSqueakTemp_openDelimiter).
	_gsSqueakTemp_level := 1.
	_gsSqueakTemp_inside := nil.
	"Tricky."
	(_gsSqueakTemp_here > 1
			and: [(_gsSqueakTemp_string at: _gsSqueakTemp_here - 1)
					= $$])
		ifTrue: [^ self].
	"Just a character literal."
	[_gsSqueakTemp_level > 0
		and: [_gsSqueakTemp_here > 1]]
		whileTrue: [| hereChar |
			hereChar := _gsSqueakTemp_string at: (_gsSqueakTemp_here := _gsSqueakTemp_here - 1).
			_gsSqueakTemp_inside
				ifNil: [(_gsSqueakTemp_here > 1
							and: [(_gsSqueakTemp_string at: _gsSqueakTemp_here - 1)
									= $$])
						ifTrue: ["Just a character literal."
							_gsSqueakTemp_here := _gsSqueakTemp_here - 1]
						ifFalse: [hereChar caseOf: {
								[_gsSqueakTemp_closeDelimiter] -> 
									[(_gsSqueakTemp_level := _gsSqueakTemp_level - 1) = 0
										ifTrue: [^ self blinkParenAt: _gsSqueakTemp_here]].
								[_gsSqueakTemp_openDelimiter] -> [_gsSqueakTemp_level := _gsSqueakTemp_level + 1].
								[$"] -> [_gsSqueakTemp_inside := $"].
								[$'] -> [_gsSqueakTemp_inside := $']}
								 otherwise: []]]
				ifNotNil: ["Are we inside a comment or string literal?"
					"Yes."
					hereChar = _gsSqueakTemp_inside
						ifTrue: [(_gsSqueakTemp_here > 1
									and: [(_gsSqueakTemp_string at: _gsSqueakTemp_here - 1)
											~= _gsSqueakTemp_inside])
								ifTrue: [_gsSqueakTemp_inside := nil]
								ifFalse: [_gsSqueakTemp_here := _gsSqueakTemp_here - 1]]]]