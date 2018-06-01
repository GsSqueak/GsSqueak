layout
minExtentFrom: minExtent 
	"Return the minimal extent the given bounds can be represented in"
	^ (self minWidthFrom: minExtent x)
		@ (self minHeightFrom: minExtent y)