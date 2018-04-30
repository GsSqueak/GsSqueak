conversions
halfTonePattern1
	"Return a halftone-pattern to approximate luminance levels on 1-bit deep Forms."

	| lum |
	lum := self luminance.
	lum < 0.1 ifTrue: [^ Bitmap with: 16rFFFFFFFF]. "black"
	lum < 0.4 ifTrue: [^ Bitmap with: 16rBBBBBBBB with: 16rEEEEEEEE]. "dark gray"
	lum < 0.6 ifTrue: [^ Bitmap with: 16r55555555 with: 16rAAAAAAAA]. "medium gray"
	lum < 0.9 ifTrue: [^ Bitmap with: 16r44444444 with: 16r11111111]. "light gray"
	^ Bitmap with: 0  "1-bit white"
