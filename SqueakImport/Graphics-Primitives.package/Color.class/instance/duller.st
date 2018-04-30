transformations
duller
	"Answer a darker, desaturated color.  If the original color isn't very saturated, desaturate it by less (otherwise will just end up with grey). If the original color is a grey, don't try to be smart."
	| sat adjust |
	(sat := self saturation) > 0.3
		ifTrue: [adjust := -0.1]
		ifFalse: [adjust := 0.1 - sat max: 0.0].
	^ sat isZero 
		ifTrue: [self adjustBrightness: -0.1]
		ifFalse: [self adjustSaturation: adjust brightness: -0.1]