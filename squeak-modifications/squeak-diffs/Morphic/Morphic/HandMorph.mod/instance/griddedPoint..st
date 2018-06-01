gridded cursor
griddedPoint: aPoint
	"return the equivalent point snapped to the grid, if indeed any gridding is set"
	self valueOfProperty: #gridStep ifPresentDo: [:grid| |offset|
		offset := self valueOfProperty: #gridOffset ifAbsent: [0@0].
		^ offset + (aPoint + (grid //2) - offset truncateTo: grid)].
	^aPoint