geometry ranges
vLeftoverScrollRange
	"Return the entire scrolling range minus the currently viewed area."
	^ scroller hasSubmorphs
		ifTrue: [self vTotalScrollRange - scroller height max: 0]
		ifFalse: [0]