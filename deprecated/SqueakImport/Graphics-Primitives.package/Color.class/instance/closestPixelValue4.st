conversions
closestPixelValue4
	"Return the nearest approximation to this color for a 4-bit deep Form."

	| bIndex |
	"fast special cases"
	rgb = 0 ifTrue: [^ 1].  "black"
	rgb = 16r3FFFFFFF ifTrue: [^ 2].  "opaque white"

	rgb = PureRed privateRGB ifTrue: [^ 4].
	rgb = PureGreen privateRGB ifTrue: [^ 5].
	rgb = PureBlue privateRGB ifTrue: [^ 6].
	rgb = PureCyan privateRGB ifTrue: [^ 7].
	rgb = PureYellow privateRGB ifTrue: [^ 8].
	rgb = PureMagenta privateRGB ifTrue: [^ 9].

	bIndex := (self luminance * 8.0) rounded.  "bIndex in [0..8]"
	^ #(
		1	"black"
		10	"1/8 gray"
		11	"2/8 gray"
		12	"3/8 gray"
		3	"4/8 gray"
		13	"5/8 gray"
		14	"6/8 gray"
		15	"7/8 gray"
		2	"opaque white"
	) at: bIndex + 1.
