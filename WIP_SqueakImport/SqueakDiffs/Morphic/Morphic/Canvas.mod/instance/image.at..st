drawing-obsolete
image: aForm at: aPoint
	"Note: This protocol is deprecated. Use #paintImage: instead."
	self image: aForm
		at: aPoint
		sourceRect: aForm boundingBox
		rule: Form paint.
