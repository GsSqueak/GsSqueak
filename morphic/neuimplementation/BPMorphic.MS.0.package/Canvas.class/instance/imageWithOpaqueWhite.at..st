drawing-obsolete
imageWithOpaqueWhite: aForm at: aPoint 
	"Note: This protocol is deprecated. Use #drawImage: instead"
	self
		image: aForm
		at: aPoint
		sourceRect: (0 @ 0 extent: aForm extent)
		rule: Form over