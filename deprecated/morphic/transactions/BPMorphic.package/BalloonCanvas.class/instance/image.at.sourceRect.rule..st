private
image: aForm at: aPoint sourceRect: sourceRect rule: rule 
	| _gsSqueakTemp_warp _gsSqueakTemp_dstRect _gsSqueakTemp_srcQuad _gsSqueakTemp_dstOffset _gsSqueakTemp_center |
	(self ifNoTransformWithIn: sourceRect)
			& false
		ifTrue: [^ super
				image: aForm
				at: aPoint
				sourceRect: sourceRect
				rule: rule].
	_gsSqueakTemp_dstRect := transform
				localBoundsToGlobal: (aForm boundingBox translateBy: aPoint).
	_gsSqueakTemp_dstOffset := 0 @ 0.
	"dstRect origin."
	"dstRect := 0@0 corner: dstRect extent."
	_gsSqueakTemp_center := 0 @ 0.
	"transform globalPointToLocal: dstRect origin."
	_gsSqueakTemp_srcQuad := transform globalPointsToLocal: _gsSqueakTemp_dstRect innerCorners.
	_gsSqueakTemp_srcQuad := _gsSqueakTemp_srcQuad
				collect: [:pt | pt - aPoint].
	_gsSqueakTemp_warp := (WarpBlt toForm: form) sourceForm: aForm;
				 cellSize: 2;
				 combinationRule: Form over.
	"installs a new colormap if cellSize > 1"
	_gsSqueakTemp_warp
		copyQuad: _gsSqueakTemp_srcQuad
		toRect: (_gsSqueakTemp_dstRect translateBy: _gsSqueakTemp_dstOffset).
	self
		frameRectangle: (aForm boundingBox translateBy: aPoint)
		color: Color green