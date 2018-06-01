drawing
generateInterpolatedForm
	"Draw the given form onto the canvas using the Balloon 3D engine"
	| _gsSqueakTemp_aCanvas _gsSqueakTemp_extent |
	_gsSqueakTemp_extent := (originalForm extent * scalePoint) asIntegerPoint.
	rotatedForm := Form extent: _gsSqueakTemp_extent asIntegerPoint depth: originalForm depth.
	_gsSqueakTemp_aCanvas := rotatedForm getCanvas.
	^ self drawInterpolatedImage: originalForm on: _gsSqueakTemp_aCanvas