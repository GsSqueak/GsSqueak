scaling, rotation
clippedToSize: aPoint 
	"Return a copy of this form that is clipped to the given size around the
	center. "
	| newForm |
	newForm := self class extent: aPoint depth: depth.
	^ newForm
		copyBits: ((0 @ 0 corner: aPoint)
				translateBy: self extent - aPoint // 2)
		from: self
		at: 0 @ 0
		clippingBox: newForm boundingBox
		rule: Form over
		fillColor: nil