geometry
leftoverScrollRange
	"Return the entire scrolling range minus the currently viewed area."
	^ self totalScrollRange - (self innerBounds extent * 3 // 4) max: 0@0
