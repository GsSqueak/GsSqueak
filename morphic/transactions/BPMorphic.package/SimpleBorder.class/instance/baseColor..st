accessing
baseColor: aColor 
	baseColor = aColor
		ifTrue: [^ self].
	baseColor := aColor.
	self color: aColor
	"#color: will do #releaseCachedState"