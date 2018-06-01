private
lineIndexForPoint: aPoint 
	"Answer the index of the line in which to select the character nearest
	to aPoint."
	| _gsSqueakTemp_i _gsSqueakTemp_py |
	_gsSqueakTemp_py := aPoint y truncated.
	"Find the first line at this y-value"
	_gsSqueakTemp_i := (self
				fastFindFirstLineSuchThat: [:line | line bottom > _gsSqueakTemp_py])
				min: lines size.
	"Now find the first line at this x-value"
	[_gsSqueakTemp_i < lines size
		and: [(lines at: _gsSqueakTemp_i + 1) top = (lines at: _gsSqueakTemp_i) top
				and: [aPoint x >= (lines at: _gsSqueakTemp_i + 1) left]]]
		whileTrue: [_gsSqueakTemp_i := _gsSqueakTemp_i + 1].
	^ _gsSqueakTemp_i