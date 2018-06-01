header
headerHeight
	"Return the (additional) height of the header in inches."
	self noHeader ifTrue:[^0.0].
	^(self pix2in: 0@TextStyle default lineGrid) y * 2