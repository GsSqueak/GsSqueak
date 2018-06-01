drawing
generateInterpolatedForm
	"Draw the given form onto the canvas using the Balloon 3D engine"
	| aCanvas extent |
	extent := (originalForm extent * scalePoint) asIntegerPoint.
	rotatedForm := Form extent: extent asIntegerPoint depth: originalForm depth.
	aCanvas := rotatedForm getCanvas.
	^self drawInterpolatedImage: originalForm on: aCanvas