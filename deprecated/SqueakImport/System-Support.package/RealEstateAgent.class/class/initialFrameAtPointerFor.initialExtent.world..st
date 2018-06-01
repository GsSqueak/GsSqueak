framing - private
initialFrameAtPointerFor: aView initialExtent: scaledExtent world: aWorld
	^(aWorld cursorPoint - (50@10)	"puts use with the mouse ptr just to the right of the menu button"
		extent: scaledExtent)
			translatedAndSquishedToBeWithin: (self maximumUsableAreaInWorld: aWorld)