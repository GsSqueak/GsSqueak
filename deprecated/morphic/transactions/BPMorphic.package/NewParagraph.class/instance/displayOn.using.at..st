fonts-display
displayOn: aCanvas using: displayScanner at: somePosition 
	"Send all visible lines to the displayScanner for display"
	| _gsSqueakTemp_visibleRectangle _gsSqueakTemp_offset _gsSqueakTemp_leftInRun _gsSqueakTemp_line |
	_gsSqueakTemp_visibleRectangle := aCanvas clipRect.
	_gsSqueakTemp_offset := (somePosition - positionWhenComposed) truncated.
	_gsSqueakTemp_leftInRun := 0.
	(self lineIndexForPoint: _gsSqueakTemp_visibleRectangle topLeft)
		to: (self lineIndexForPoint: _gsSqueakTemp_visibleRectangle bottomRight)
		do: [:i | 
			_gsSqueakTemp_line := lines at: i.
			self displaySelectionInLine: _gsSqueakTemp_line on: aCanvas.
			_gsSqueakTemp_line first <= _gsSqueakTemp_line last
				ifTrue: [_gsSqueakTemp_leftInRun := displayScanner
								displayLine: _gsSqueakTemp_line
								offset: _gsSqueakTemp_offset
								leftInRun: _gsSqueakTemp_leftInRun]]