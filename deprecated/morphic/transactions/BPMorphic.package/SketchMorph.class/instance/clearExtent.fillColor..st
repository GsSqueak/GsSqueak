pen support
clearExtent: aPoint fillColor: aColor 
	"Make this sketch have the given pixel dimensions and fill it with given
	color. Its previous contents are replaced."
	self
		form: ((Form extent: aPoint depth: Display depth)
				fillColor: aColor)