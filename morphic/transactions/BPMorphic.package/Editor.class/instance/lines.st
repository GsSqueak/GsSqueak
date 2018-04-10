private
lines
	"Compute lines based on logical line breaks, not optical (which may
	change due to line wrapping of the editor).
	Subclasses using kinds of Paragraphs can instead use the service
	provided by it."
	| _gsSqueakTemp_lines _gsSqueakTemp_string _gsSqueakTemp_lineIndex |
	_gsSqueakTemp_string := self string.
	"Empty strings have no lines at all. Think of something."
	_gsSqueakTemp_string isEmpty
		ifTrue: [^ {#(1 0 0 )}].
	_gsSqueakTemp_lines := OrderedCollection new: _gsSqueakTemp_string size // 15.
	_gsSqueakTemp_lineIndex := 0.
	_gsSqueakTemp_string
		lineIndicesDo: [:start :endWithoutDelimiters :end | _gsSqueakTemp_lineIndex := _gsSqueakTemp_lineIndex + 1. _gsSqueakTemp_lines addLast: {start. _gsSqueakTemp_lineIndex. end}].
	"Special workaround for last line empty."
	(_gsSqueakTemp_string last == Character cr
			or: [_gsSqueakTemp_string last == Character lf])
		ifTrue: [_gsSqueakTemp_lines addLast: {_gsSqueakTemp_string size + 1. _gsSqueakTemp_lineIndex + 1. _gsSqueakTemp_string size}].
	^ _gsSqueakTemp_lines