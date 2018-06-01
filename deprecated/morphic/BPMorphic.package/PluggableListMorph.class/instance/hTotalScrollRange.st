scroll cache
hTotalScrollRange
	"Return the entire scrolling range."
	self resetHScrollRangeIfNecessary.
	^ hScrollRangeCache first