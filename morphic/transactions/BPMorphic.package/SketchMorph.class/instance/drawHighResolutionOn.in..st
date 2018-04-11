drawing
drawHighResolutionOn: aCanvas in: aRectangle 
	| _gsSqueakTemp_r _gsSqueakTemp_finalClipRect _gsSqueakTemp_scale _gsSqueakTemp_sourceOrigin _gsSqueakTemp_sourceExtent _gsSqueakTemp_sourceRect _gsSqueakTemp_biggerSource _gsSqueakTemp_biggerDestExtent _gsSqueakTemp_interForm _gsSqueakTemp_offsetInBigger |
	_gsSqueakTemp_r := aRectangle translateBy: aCanvas origin.
	_gsSqueakTemp_finalClipRect := _gsSqueakTemp_r
				intersect: (aCanvas clipRect translateBy: aCanvas origin).
	self canBeEnlargedWithB3D
		ifTrue: [(WarpBlt toForm: aCanvas form) clipRect: _gsSqueakTemp_finalClipRect;
				 sourceForm: originalForm;
				 cellSize: 2;
				 combinationRule: Form paint;
				 copyQuad: originalForm boundingBox innerCorners toRect: _gsSqueakTemp_r.
			"installs a colormap"
			^ self].
	_gsSqueakTemp_scale := aRectangle extent / originalForm extent.
	_gsSqueakTemp_sourceOrigin := originalForm offset + (aCanvas clipRect origin - aRectangle origin / _gsSqueakTemp_scale).
	_gsSqueakTemp_sourceExtent := aCanvas clipRect extent / _gsSqueakTemp_scale.
	_gsSqueakTemp_sourceRect := _gsSqueakTemp_sourceOrigin rounded extent: _gsSqueakTemp_sourceExtent rounded.
	_gsSqueakTemp_biggerSource := _gsSqueakTemp_sourceRect expandBy: 1.
	_gsSqueakTemp_biggerDestExtent := (_gsSqueakTemp_biggerSource extent * _gsSqueakTemp_scale) rounded.
	_gsSqueakTemp_offsetInBigger := (_gsSqueakTemp_sourceOrigin - _gsSqueakTemp_biggerSource origin * _gsSqueakTemp_scale) rounded.
	_gsSqueakTemp_interForm := Form extent: _gsSqueakTemp_biggerDestExtent depth: aCanvas depth.
	(originalForm copy: _gsSqueakTemp_biggerSource)
		displayInterpolatedIn: _gsSqueakTemp_interForm boundingBox
		on: _gsSqueakTemp_interForm.
	aCanvas
		drawImage: _gsSqueakTemp_interForm
		at: aCanvas clipRect origin
		sourceRect: (_gsSqueakTemp_offsetInBigger extent: aCanvas clipRect extent)