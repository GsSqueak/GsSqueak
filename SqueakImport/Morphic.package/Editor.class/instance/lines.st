private
lines
	"Compute lines based on logical line breaks, not optical (which may change due to line wrapping of the editor).
	Subclasses using kinds of Paragraphs can instead use the service provided by it."
	| lines string lineIndex |
	string := self string.
	"Empty strings have no lines at all. Think of something."
	string isEmpty ifTrue:[^{#(1 0 0)}].
	lines := OrderedCollection new: (string size // 15).
	lineIndex := 0.
	string lineIndicesDo: [:start :endWithoutDelimiters :end |
		lines addLast: {start. (lineIndex := lineIndex + 1). end}].
	"Special workaround for last line empty."
	(string last == Character cr or: [string last == Character lf])
		ifTrue: [lines addLast: {string size + 1. lineIndex + 1. string size}].
	^lines