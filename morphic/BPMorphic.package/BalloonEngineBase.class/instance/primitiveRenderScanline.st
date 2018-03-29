primitives-rendering
primitiveRenderScanline
	"Start rendering the entire image"
	| _gsSqueakTemp_failCode |
	(_gsSqueakTemp_failCode := self loadRenderingState) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failCode].
	self proceedRenderingScanline.
	"Finish the current scan line"
	self storeRenderingState