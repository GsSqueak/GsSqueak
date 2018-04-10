editing keys
inOutdent: aKeyboardEvent delta: delta 
	"Add/remove a tab at the front of every line occupied by the selection.
	Flushes typeahead. Derived from work by Larry Tesler back in
	December 1985. Now triggered by Cmd-L and Cmd-R. 2/29/96 sw"
	"indentation"
	"Operate on entire lines, but remember the real selection for
	re-highlighting later"
	| _gsSqueakTemp_realStart _gsSqueakTemp_realStop _gsSqueakTemp_lines _gsSqueakTemp_startLine _gsSqueakTemp_stopLine _gsSqueakTemp_start _gsSqueakTemp_stop _gsSqueakTemp_adjustStart _gsSqueakTemp_numLines _gsSqueakTemp_oldText _gsSqueakTemp_newText _gsSqueakTemp_newSize |
	_gsSqueakTemp_realStart := self startIndex.
	_gsSqueakTemp_realStop := self stopIndex - 1.
	"Special case a caret on a line of its own, including weird case at end
	of paragraph"
	(_gsSqueakTemp_realStart > _gsSqueakTemp_realStop
			and: [_gsSqueakTemp_realStart < 2
					or: [(paragraph string at: _gsSqueakTemp_realStart - 1)
								== Character cr
							or: [(paragraph string at: _gsSqueakTemp_realStart - 1)
									== Character lf]]])
		ifTrue: [delta < 0
				ifTrue: [morph flash]
				ifFalse: [self replaceSelectionWith: Character tab asText.
					self selectAt: _gsSqueakTemp_realStart + 1].
			^ true].
	_gsSqueakTemp_lines := paragraph lines.
	_gsSqueakTemp_startLine := paragraph lineIndexOfCharacterIndex: _gsSqueakTemp_realStart.
	"start on a real line, not a wrapped line"
	[_gsSqueakTemp_startLine = 1
		or: [CharacterSet crlf
				includes: (paragraph string at: (_gsSqueakTemp_lines at: _gsSqueakTemp_startLine - 1) last)]]
		whileFalse: [_gsSqueakTemp_startLine := _gsSqueakTemp_startLine - 1].
	_gsSqueakTemp_stopLine := paragraph
				lineIndexOfCharacterIndex: (_gsSqueakTemp_realStart max: _gsSqueakTemp_realStop).
	_gsSqueakTemp_start := (_gsSqueakTemp_lines at: _gsSqueakTemp_startLine) first.
	_gsSqueakTemp_stop := (_gsSqueakTemp_lines at: _gsSqueakTemp_stopLine) last.
	"Pin the start of highlighting unless the selection starts a line"
	_gsSqueakTemp_adjustStart := _gsSqueakTemp_realStart > _gsSqueakTemp_start.
	"Find the indentation of the least-indented non-blank line; never
	outdent more"
	"indentation := (startLine to: stopLine) inject: 1000 into:
	[:m :l |
	m min: (paragraph indentationOfLineIndex: l ifBlank: [:tabs | 1000])].
	indentation + delta <= 0 ifTrue: [^false]."
	_gsSqueakTemp_numLines := _gsSqueakTemp_stopLine + 1 - _gsSqueakTemp_startLine.
	_gsSqueakTemp_oldText := paragraph text copyFrom: _gsSqueakTemp_start to: _gsSqueakTemp_stop.
	_gsSqueakTemp_newText := _gsSqueakTemp_oldText species new: _gsSqueakTemp_oldText size
					+ (_gsSqueakTemp_numLines * delta max: 0).
	"Do the actual work"
	_gsSqueakTemp_newSize := 0.
	delta > 0
		ifTrue: [| tabs |
			tabs := _gsSqueakTemp_oldText species new: delta withAll: Character tab.
			_gsSqueakTemp_oldText string
				lineIndicesDo: [:startL :endWithoutDelimiters :endL | 
					startL < endWithoutDelimiters
						ifTrue: [_gsSqueakTemp_newText
								replaceFrom: 1 + _gsSqueakTemp_newSize
								to: (_gsSqueakTemp_newSize := _gsSqueakTemp_newSize + delta)
								with: tabs
								startingAt: 1].
					_gsSqueakTemp_newText
						replaceFrom: 1 + _gsSqueakTemp_newSize
						to: (_gsSqueakTemp_newSize := 1 + _gsSqueakTemp_newSize + endL - startL)
						with: _gsSqueakTemp_oldText
						startingAt: startL]]
		ifFalse: [| tab |
			tab := Character tab.
			_gsSqueakTemp_oldText string
				lineIndicesDo: [:startL :endWithoutDelimiters :endL | 
					| i |
					i := 0.
					[i + delta < 0
						and: [i + startL <= endWithoutDelimiters
								and: [(_gsSqueakTemp_oldText at: i + startL)
										== tab]]]
						whileTrue: [i := i + 1].
					_gsSqueakTemp_newText
						replaceFrom: 1 + _gsSqueakTemp_newSize
						to: (_gsSqueakTemp_newSize := 1 + _gsSqueakTemp_newSize + endL - (i + startL))
						with: _gsSqueakTemp_oldText
						startingAt: i + startL]].
	_gsSqueakTemp_newSize < _gsSqueakTemp_newText size
		ifTrue: [_gsSqueakTemp_newText := _gsSqueakTemp_newText copyFrom: 1 to: _gsSqueakTemp_newSize].
	"Adjust the range that will be highlighted later"
	_gsSqueakTemp_adjustStart
		ifTrue: [_gsSqueakTemp_realStart := _gsSqueakTemp_realStart + delta max: _gsSqueakTemp_start].
	_gsSqueakTemp_realStop := _gsSqueakTemp_realStop + _gsSqueakTemp_newSize - _gsSqueakTemp_oldText size.
	"Replace selection"
	self selectInvisiblyFrom: _gsSqueakTemp_start to: _gsSqueakTemp_stop.
	self replaceSelectionWith: _gsSqueakTemp_newText.
	self selectFrom: _gsSqueakTemp_realStart to: _gsSqueakTemp_realStop.
	"highlight only the original range"
	^ true