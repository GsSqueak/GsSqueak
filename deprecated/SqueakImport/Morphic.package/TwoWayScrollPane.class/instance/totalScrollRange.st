geometry
totalScrollRange

	"Return the entire scrolling range."
	^ ((scroller localVisibleSubmorphBounds ifNil: [^nil]) encompass: 0@0) extent

