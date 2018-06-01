geometry
vSetScrollDelta
	"Set the ScrollBar deltas, value and interval, based on the current scroll pane size, offset and range."

	| delta |	
	delta := self scrollDeltaHeight.

	scrollBar
			truncate: true;
			scrollDelta: delta 
			pageDelta: 10*delta;
			maximumValue: self vLeftoverScrollRange;
			interval: (self vTotalScrollRange = 0
				ifTrue: [1.0]
				ifFalse: [scroller height / self vTotalScrollRange]);
			setValue: scroller offset y.