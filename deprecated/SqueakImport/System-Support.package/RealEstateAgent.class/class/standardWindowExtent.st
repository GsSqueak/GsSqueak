settings
standardWindowExtent
	"Answer the standard default extent for new windows.  "

	| effectiveExtent width strips height grid allowedArea maxLevel extent |
	effectiveExtent := self maximumUsableArea extent
					- (self scrollBarSetback @ self screenTopSetback).
	Preferences reverseWindowStagger ifTrue:
		["NOTE: following copied from strictlyStaggeredInitialFrameFor:"
		allowedArea := self maximumUsableArea insetBy: (
			self scrollBarSetback @ self screenTopSetback extent: 0@0
		).
		"Number to be staggered at each corner (less on small screens)"
		maxLevel := allowedArea area > 300000 ifTrue: [3] ifFalse: [2].
		"Amount by which to stagger (less on small screens)"
		grid := allowedArea area > 500000 ifTrue: [40] ifFalse: [20].
		extent := (allowedArea extent - (grid*(maxLevel+1*2) + (grid//2))) min: StandardSize "600@400".
		(extent y < 300) ifTrue: [^ (extent x)@300 ].
		^ extent].
	width := (strips := self windowColumnsDesired) > 1
		ifTrue:
			[effectiveExtent x // strips]
		ifFalse:
			[(3 * effectiveExtent x) // 4].
	height := (strips := self windowRowsDesired) > 1
		ifTrue:
			[effectiveExtent y // strips]
		ifFalse:
			[(3 * effectiveExtent y) //4].
	^ width @ height

"RealEstateAgent standardWindowExtent"