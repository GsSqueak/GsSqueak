drawing
registerFill: aFillStyle 
	"Register the given fill style."
	| _gsSqueakTemp_theForm |
	aFillStyle
		ifNil: [^ 0].
	aFillStyle isSolidFill
		ifTrue: [^ aFillStyle scaledPixelValue32].
	aFillStyle isGradientFill
		ifTrue: [^ self
				primAddGradientFill: aFillStyle pixelRamp
				from: aFillStyle origin
				along: aFillStyle direction
				normal: aFillStyle normal
				radial: aFillStyle isRadialFill].
	aFillStyle isBitmapFill
		ifTrue: [_gsSqueakTemp_theForm := aFillStyle form asSourceForm.
			_gsSqueakTemp_theForm unhibernate.
			forms := forms copyWith: _gsSqueakTemp_theForm.
			^ self
				primAddBitmapFill: _gsSqueakTemp_theForm
				colormap: (_gsSqueakTemp_theForm colormapIfNeededForDepth: 32)
				tile: aFillStyle isTiled
				from: aFillStyle origin
				along: aFillStyle direction
				normal: aFillStyle normal
				xIndex: forms size].
	^ 0