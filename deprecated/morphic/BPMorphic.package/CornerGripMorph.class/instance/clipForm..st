private
clipForm: aHandle 
	"This doesn't really needs to be done every draw, but only if border
	width changes.
	In that case,, we'd have to install a newly initialized one anyways, so
	the current method will fail.
	Good enough for now though."
	| _gsSqueakTemp_cutArea |
	_gsSqueakTemp_cutArea := self transparentRectangle.
	aHandle getCanvas
		image: _gsSqueakTemp_cutArea
		at: self borderOffset
		sourceRect: _gsSqueakTemp_cutArea boundingBox
		rule: Form and.
	^ aHandle