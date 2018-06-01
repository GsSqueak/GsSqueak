private
clipForm: aHandle
	|cutArea|
	"This doesn't really needs to be done every draw, but only if border width changes.
	In that case,, we'd have to install a newly initialized one anyways, so the current method will fail.
	Good enough for now though."
	cutArea := self transparentRectangle.
	aHandle getCanvas image: cutArea 
		at: self borderOffset 
		sourceRect: cutArea boundingBox 
		rule: Form and. 
	^aHandle
	
	