images
downImage
	"answer a form to be used in the down button"
	^ self class
		arrowOfDirection: (self orientation == #horizontal
				ifTrue: [#right]
				ifFalse: [#bottom])
		size: (self buttonExtent x min: self buttonExtent y)
		color: self imageColor