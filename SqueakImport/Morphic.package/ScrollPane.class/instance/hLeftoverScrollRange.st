geometry ranges
hLeftoverScrollRange
	"Return the entire scrolling range minus the currently viewed area."

	^ scroller hasSubmorphs
		ifFalse: [0]
		ifTrue: [self hTotalScrollRange - scroller width max: 0]
