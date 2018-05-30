tally support
getSelectedText
	| m interval text |
	m := self codeTextMorph ifNil: [^ ''].
	interval := m selectionInterval.
	text := m text.
	^ text copyFrom: interval first to: interval last
	