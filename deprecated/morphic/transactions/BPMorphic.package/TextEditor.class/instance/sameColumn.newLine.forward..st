private
sameColumn: start newLine: lineBlock forward: isForward 
	"Private - Compute the index in my text
	with the line number derived from lineBlock,"
	"a one argument block accepting the old line number.
	The position inside the line will be preserved as good as possible"
	"The boolean isForward is used in the border case to determine if
	we should move to the beginning or the end of the line."
	| _gsSqueakTemp_wordStyle _gsSqueakTemp_column _gsSqueakTemp_currentLine _gsSqueakTemp_offsetAtTargetLine _gsSqueakTemp_targetEOL _gsSqueakTemp_lines _gsSqueakTemp_numberOfLines _gsSqueakTemp_currentLineNumber _gsSqueakTemp_targetLineNumber |
	_gsSqueakTemp_wordStyle := Preferences wordStyleCursorMovement.
	_gsSqueakTemp_wordStyle
		ifTrue: [_gsSqueakTemp_lines := paragraph lines.
			_gsSqueakTemp_numberOfLines := paragraph numberOfLines.
			_gsSqueakTemp_currentLineNumber := paragraph lineIndexOfCharacterIndex: start.
			_gsSqueakTemp_currentLine := _gsSqueakTemp_lines at: _gsSqueakTemp_currentLineNumber]
		ifFalse: [_gsSqueakTemp_lines := self lines.
			_gsSqueakTemp_numberOfLines := _gsSqueakTemp_lines size.
			_gsSqueakTemp_currentLine := _gsSqueakTemp_lines
						detect: [:lineInterval | lineInterval last >= start]
						ifNone: [_gsSqueakTemp_lines last].
			_gsSqueakTemp_currentLineNumber := _gsSqueakTemp_currentLine second].
	_gsSqueakTemp_column := start - _gsSqueakTemp_currentLine first.
	_gsSqueakTemp_targetLineNumber := ((lineBlock value: _gsSqueakTemp_currentLineNumber)
				max: 1)
				min: _gsSqueakTemp_numberOfLines.
	_gsSqueakTemp_offsetAtTargetLine := (_gsSqueakTemp_lines at: _gsSqueakTemp_targetLineNumber) first.
	_gsSqueakTemp_targetEOL := (_gsSqueakTemp_lines at: _gsSqueakTemp_targetLineNumber) last
				+ (_gsSqueakTemp_targetLineNumber = _gsSqueakTemp_numberOfLines
						ifTrue: [1]
						ifFalse: [0]).
	_gsSqueakTemp_targetLineNumber = _gsSqueakTemp_currentLineNumber
		ifTrue: ["No movement or movement failed. Move to beginning or end
			of line."
			^ isForward
				ifTrue: [_gsSqueakTemp_targetEOL]
				ifFalse: [_gsSqueakTemp_offsetAtTargetLine]].
	^ _gsSqueakTemp_offsetAtTargetLine + _gsSqueakTemp_column min: _gsSqueakTemp_targetEOL