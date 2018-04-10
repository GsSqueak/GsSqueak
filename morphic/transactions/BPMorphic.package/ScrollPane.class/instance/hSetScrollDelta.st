geometry
hSetScrollDelta
	"Set the ScrollBar deltas, value and interval, based on the current
	scroll pane size, offset and range."
	| _gsSqueakTemp_delta |
	_gsSqueakTemp_delta := self scrollDeltaWidth.
	hScrollBar truncate: true;
		 scrollDelta: _gsSqueakTemp_delta pageDelta: 10 * _gsSqueakTemp_delta;
		 maximumValue: self hLeftoverScrollRange;
		
		interval: (self hTotalScrollRange = 0
				ifTrue: [1.0]
				ifFalse: [scroller width / self hTotalScrollRange]);
		 setValue: scroller offset x