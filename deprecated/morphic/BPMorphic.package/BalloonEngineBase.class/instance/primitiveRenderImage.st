primitives-rendering
primitiveRenderImage
	"Start/Proceed rendering the entire image"
	| _gsSqueakTemp_failCode |
	(_gsSqueakTemp_failCode := self loadRenderingState) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failCode].
	self proceedRenderingScanline.
	"Finish this scan line"
	engineStopped
		ifTrue: [^ self storeRenderingState].
	self proceedRenderingImage.
	"And go on as usual"
	self storeRenderingState