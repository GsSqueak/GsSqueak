geometry
vSetScrollDelta
	"Set the ScrollBar deltas, value and interval, based on the current
	scroll pane size, offset and range."
	| _gsSqueakTemp_delta |
	_gsSqueakTemp_delta := self scrollDeltaHeight.
	scrollBar truncate: true;
		 scrollDelta: _gsSqueakTemp_delta pageDelta: 10 * _gsSqueakTemp_delta;
		 maximumValue: self vLeftoverScrollRange;
		
		interval: (self vTotalScrollRange = 0
				ifTrue: [1.0]
				ifFalse: [scroller height / self vTotalScrollRange]);
		 setValue: scroller offset y