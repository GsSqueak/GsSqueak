geometry ranges
hLeftoverScrollRange
	"Return the entire scrolling range minus the currently viewed area."
	^ scroller hasSubmorphs
		ifTrue: [self hTotalScrollRange - scroller width max: 0]
		ifFalse: [0]