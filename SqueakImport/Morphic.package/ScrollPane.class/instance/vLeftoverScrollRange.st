geometry ranges
vLeftoverScrollRange
	"Return the entire scrolling range minus the currently viewed area."

	^ scroller hasSubmorphs
		ifFalse: [0]
		ifTrue: [self vTotalScrollRange - scroller height max: 0]
