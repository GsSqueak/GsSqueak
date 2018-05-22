scroll range
widthToDisplayItem: item
	| widths |
	widths := item collect: [ :each | super widthToDisplayItem: each ].
	^widths sum + (10 * (widths size - 1))   "add in space between the columns"
