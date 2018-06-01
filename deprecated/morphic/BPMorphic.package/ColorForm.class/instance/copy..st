copying
copy: aRect 
	"Return a new ColorForm containing the portion of the receiver
	delineated by aRect."
	| _gsSqueakTemp_newForm |
	_gsSqueakTemp_newForm := self species extent: aRect extent depth: depth.
	((BitBlt
		destForm: _gsSqueakTemp_newForm
		sourceForm: self
		fillColor: nil
		combinationRule: Form over
		destOrigin: 0 @ 0
		sourceOrigin: aRect origin
		extent: aRect extent
		clipRect: _gsSqueakTemp_newForm boundingBox)
		colorMap: nil) copyBits.
	colors
		ifNotNil: [_gsSqueakTemp_newForm colors: colors copy].
	^ _gsSqueakTemp_newForm