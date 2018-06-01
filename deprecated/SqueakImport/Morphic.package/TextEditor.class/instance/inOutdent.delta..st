editing keys
inOutdent: aKeyboardEvent delta: delta
	"Add/remove a tab at the front of every line occupied by the selection. Flushes typeahead.  Derived from work by Larry Tesler back in December 1985.  Now triggered by Cmd-L and Cmd-R.  2/29/96 sw"

	| realStart realStop lines startLine stopLine start stop adjustStart "indentation" numLines oldText newText newSize |

	"Operate on entire lines, but remember the real selection for re-highlighting later"
	realStart := self startIndex.
	realStop := self stopIndex - 1.

	"Special case a caret on a line of its own, including weird case at end of paragraph"
	(realStart > realStop and:
				[realStart < 2 or: [(paragraph string at: realStart - 1) == Character cr or: [(paragraph string at: realStart - 1) == Character lf]]])
		ifTrue:
			[delta < 0
				ifTrue:
					[morph flash]
				ifFalse:
					[self replaceSelectionWith: Character tab asText.
					self selectAt: realStart + 1].
			^true].

	lines := paragraph lines.
	startLine := paragraph lineIndexOfCharacterIndex: realStart.
	"start on a real line, not a wrapped line"
	[startLine = 1 or: [CharacterSet crlf includes: (paragraph string at: (lines at: startLine-1) last)]] whileFalse: [startLine := startLine - 1].
	stopLine := paragraph lineIndexOfCharacterIndex: (realStart max: realStop).
	start := (lines at: startLine) first.
	stop := (lines at: stopLine) last.

	"Pin the start of highlighting unless the selection starts a line"
	adjustStart := realStart > start.

	"Find the indentation of the least-indented non-blank line; never outdent more"
	"indentation := (startLine to: stopLine) inject: 1000 into:
		[:m :l |
		m min: (paragraph indentationOfLineIndex: l ifBlank: [:tabs | 1000])].
	indentation + delta <= 0 ifTrue: [^false]."

	numLines := stopLine + 1 - startLine.
	oldText := paragraph text copyFrom: start to: stop.
	newText := oldText species new: oldText size + ((numLines * delta) max: 0).

	"Do the actual work"
	newSize := 0.
	delta > 0
		ifTrue: [| tabs |
			tabs := oldText species new: delta withAll: Character tab.
			oldText string lineIndicesDo: [:startL :endWithoutDelimiters :endL |
				startL < endWithoutDelimiters ifTrue: [newText replaceFrom: 1 + newSize to: (newSize := newSize + delta) with: tabs startingAt: 1].
				newText replaceFrom: 1 + newSize to: (newSize := 1 + newSize + endL - startL) with: oldText startingAt: startL]]
		ifFalse: [| tab |
			tab := Character tab.
			oldText string lineIndicesDo: [:startL :endWithoutDelimiters :endL |
				| i |
				i := 0.
				[i + delta < 0 and: [ i + startL <= endWithoutDelimiters and: [(oldText at: i + startL) == tab]]] whileTrue: [i := i + 1].
				newText replaceFrom: 1 + newSize to: (newSize := 1 + newSize + endL - (i + startL)) with: oldText startingAt: i + startL]].
	newSize < newText size ifTrue: [newText := newText copyFrom: 1 to: newSize].

	"Adjust the range that will be highlighted later"
	adjustStart ifTrue: [realStart := (realStart + delta) max: start].
	realStop := realStop + newSize - oldText size.

	"Replace selection"
	self selectInvisiblyFrom: start to: stop.
	self replaceSelectionWith: newText.
	self selectFrom: realStart to: realStop. 	"highlight only the original range"
	^ true