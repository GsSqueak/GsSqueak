pen
setDotSize: aNumber 
	"Set the trail dot size as indicated, but confine matters to a reasonable
	range "
	self costume renderedMorph
		setProperty: #trailDotSize
		toValue: ((aNumber max: 1)
				min: 100)