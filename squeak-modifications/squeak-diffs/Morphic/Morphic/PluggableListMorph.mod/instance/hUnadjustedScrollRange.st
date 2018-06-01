scroll cache
hUnadjustedScrollRange
	"Return the entire scrolling range."

	 self resetHScrollRangeIfNecessary.

	^hScrollRangeCache second
