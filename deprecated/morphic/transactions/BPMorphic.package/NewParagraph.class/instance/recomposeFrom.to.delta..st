composition
recomposeFrom: start to: stop delta: delta 
	"Recompose this paragraph. The altered portion is between start and
	stop. Recomposition may continue to the end of the text, due to a
	ripple effect.
	Delta is the amount by which the current text is longer than it was
	when its current lines were composed."
	"Have to recompose line above in case a word-break was affected."
	| _gsSqueakTemp_startLine _gsSqueakTemp_newLines |
	_gsSqueakTemp_startLine := (self lineIndexOfCharacterIndex: start)
				- 1 max: 1.
	[_gsSqueakTemp_startLine > 1
		and: [(lines at: _gsSqueakTemp_startLine - 1) top = (lines at: _gsSqueakTemp_startLine) top]]
		whileTrue: [_gsSqueakTemp_startLine := _gsSqueakTemp_startLine - 1].
	"Find leftmost of line pieces"
	_gsSqueakTemp_newLines := OrderedCollection new: lines size + 1.
	1
		to: _gsSqueakTemp_startLine - 1
		do: [:i | _gsSqueakTemp_newLines
				addLast: (lines at: i)].
	self
		composeLinesFrom: (lines at: _gsSqueakTemp_startLine) first
		to: stop
		delta: delta
		into: _gsSqueakTemp_newLines
		priorLines: lines
		atY: (lines at: _gsSqueakTemp_startLine) top