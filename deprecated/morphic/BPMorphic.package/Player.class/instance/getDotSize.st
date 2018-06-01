pen
getDotSize
	"Answer the receiver's dotSize"
	^ self costume renderedMorph
		valueOfProperty: #trailDotSize
		ifAbsentPut: [6]