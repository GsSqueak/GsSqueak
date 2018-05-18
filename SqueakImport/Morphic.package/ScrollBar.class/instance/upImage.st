images
upImage
	"answer a form to be used in the up button"
	^ self class
		arrowOfDirection: (self orientation == #horizontal
				ifTrue: [#left]
				ifFalse: [#top])
		size: (self buttonExtent x min: self buttonExtent y)
		color: self imageColor