new selection
selectWordLeftDelimiters: leftDelimiters rightDelimiters: rightDelimiters 
	"Select delimited text or word--the result of double-clicking."
	| _gsSqueakTemp_openDelimiter _gsSqueakTemp_closeDelimiter _gsSqueakTemp_direction _gsSqueakTemp_match _gsSqueakTemp_level _gsSqueakTemp_string _gsSqueakTemp_here _gsSqueakTemp_hereChar _gsSqueakTemp_start _gsSqueakTemp_stop |
	_gsSqueakTemp_string := self string.
	_gsSqueakTemp_string size < 2
		ifTrue: [^ self].
	_gsSqueakTemp_here := self pointIndex.
	"Select the whole text when clicking before first or after last character"
	(_gsSqueakTemp_here > _gsSqueakTemp_string size
			or: [_gsSqueakTemp_here < 2])
		ifTrue: [^ self selectFrom: 1 to: _gsSqueakTemp_string size].
	_gsSqueakTemp_openDelimiter := _gsSqueakTemp_string at: _gsSqueakTemp_here - 1.
	_gsSqueakTemp_closeDelimiter := _gsSqueakTemp_string at: _gsSqueakTemp_here.
	(_gsSqueakTemp_match := leftDelimiters indexOf: _gsSqueakTemp_openDelimiter)
			> (rightDelimiters indexOf: _gsSqueakTemp_closeDelimiter)
		ifTrue: ["a more-distinct delimiter is on the left -- match to the right"
			_gsSqueakTemp_start := _gsSqueakTemp_here.
			_gsSqueakTemp_direction := 1.
			_gsSqueakTemp_here := _gsSqueakTemp_here - 1.
			_gsSqueakTemp_closeDelimiter := rightDelimiters at: _gsSqueakTemp_match]
		ifFalse: [_gsSqueakTemp_openDelimiter := _gsSqueakTemp_string at: _gsSqueakTemp_here.
			_gsSqueakTemp_match := rightDelimiters indexOf: _gsSqueakTemp_openDelimiter.
			_gsSqueakTemp_match > 0
				ifTrue: ["delimiter is on right -- match to the left"
					_gsSqueakTemp_stop := _gsSqueakTemp_here - 1.
					_gsSqueakTemp_direction := -1.
					_gsSqueakTemp_closeDelimiter := leftDelimiters at: _gsSqueakTemp_match]
				ifFalse: ["no delimiters -- select a token"
					_gsSqueakTemp_direction := -1]].
	_gsSqueakTemp_level := 1.
	[_gsSqueakTemp_level > 0
		and: [_gsSqueakTemp_direction > 0
				ifTrue: [_gsSqueakTemp_here < _gsSqueakTemp_string size]
				ifFalse: [_gsSqueakTemp_here > 1]]]
		whileTrue: [_gsSqueakTemp_hereChar := _gsSqueakTemp_string at: (_gsSqueakTemp_here := _gsSqueakTemp_here + _gsSqueakTemp_direction).
			_gsSqueakTemp_match = 0
				ifTrue: ["token scan goes left, then right"
					_gsSqueakTemp_hereChar tokenish
						ifTrue: [_gsSqueakTemp_here = 1
								ifTrue: [_gsSqueakTemp_start := 1.
									"go right if hit string start"
									_gsSqueakTemp_direction := 1]]
						ifFalse: [_gsSqueakTemp_direction < 0
								ifTrue: [_gsSqueakTemp_start := _gsSqueakTemp_here + 1.
									"go right if hit non-token"
									_gsSqueakTemp_direction := 1]
								ifFalse: [_gsSqueakTemp_level := 0]]]
				ifFalse: ["bracket match just counts nesting level"
					_gsSqueakTemp_hereChar = _gsSqueakTemp_closeDelimiter
						ifTrue: [_gsSqueakTemp_level := _gsSqueakTemp_level - 1
							"leaving nest"]
						ifFalse: [_gsSqueakTemp_hereChar = _gsSqueakTemp_openDelimiter
								ifTrue: [_gsSqueakTemp_level := _gsSqueakTemp_level + 1
									"entering deeper nest"]]]].
	_gsSqueakTemp_level > 0
		ifTrue: ["in case ran off string end"
			_gsSqueakTemp_here := _gsSqueakTemp_here + _gsSqueakTemp_direction].
	^ _gsSqueakTemp_direction > 0
		ifTrue: [self selectFrom: _gsSqueakTemp_start to: _gsSqueakTemp_here - 1]
		ifFalse: [self selectFrom: _gsSqueakTemp_here + 1 to: _gsSqueakTemp_stop]