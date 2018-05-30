point size
pointSizeList
	^self selectedTextStyle pointSizes collect: [:each | each asString padded: #left to: 3 with: $ ]