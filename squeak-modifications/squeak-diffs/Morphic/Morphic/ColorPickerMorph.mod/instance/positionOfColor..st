private
positionOfColor: aColor
	"Compute the position of the given color in the color chart form"
	| rgbRect x y h s v |
	rgbRect := (0@0 extent: originalForm boundingBox extent) insetBy: (1@10 corner: 11@1).
	h := aColor hue.
	s := aColor saturation.
	v := aColor brightness.
	h = 0.0 ifTrue:["gray"
		^(rgbRect right + 6) @ (rgbRect height * (1.0 - v) + rgbRect top)].
	x := (h + 22 \\ 360 / 360.0 * rgbRect width) rounded.
	y := 0.5.
	s < 1.0 ifTrue:[y := y - (1.0 - s * 0.5)].
	v < 1.0 ifTrue:[y := y + (1.0 - v * 0.5)].
	y := (y * rgbRect height) rounded.
	^x@y + (1@10)