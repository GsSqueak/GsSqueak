point size
selectedPointSizeIndex
	^self pointSizeList indexOf: (pointSize reduce asString padded: #left to: 3 with: $ )