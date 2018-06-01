footer
footerHeight
	"Return the (additional) height of the footer in inches."
	self noFooter ifTrue:[^0.0].
	^(self pix2in: 0@TextStyle default lineGrid) y * 2