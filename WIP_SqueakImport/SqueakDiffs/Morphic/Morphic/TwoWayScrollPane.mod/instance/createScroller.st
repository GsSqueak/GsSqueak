initialization
createScroller
"create a scroller"
	| result |
	result := TransformMorph new color: Color transparent.
	result offset: 0 @ 0.
	^ result