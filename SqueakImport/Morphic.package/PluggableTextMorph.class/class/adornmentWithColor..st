frame adornments
adornmentWithColor: aColor
	"Create and return a frame adornment with the given color"

	| size box form fillStyle |
	^self adornmentCache at: aColor ifAbsentPut:[
		size := 16. 
		box := 0@0 extent: size asPoint.
		form := Form extent: size@size depth: 32.
		fillStyle := MenuMorph gradientMenu ifFalse: [SolidFillStyle color: aColor] ifTrue: [
			(GradientFillStyle ramp: {
				0.0->(aColor alpha: 0.01).
				0.8->aColor.
				1.0->aColor})
				origin: box topRight - (size@0);
				direction: (size @ size negated) // 4;
				radial: false].
		form getCanvas drawPolygon:  {
			box topRight. 
			box topRight + (0@size). 
			box topRight - (size@0)
		} fillStyle: fillStyle.
		form].
