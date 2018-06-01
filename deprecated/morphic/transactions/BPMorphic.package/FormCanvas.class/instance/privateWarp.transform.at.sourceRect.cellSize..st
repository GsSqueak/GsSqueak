private
privateWarp: aForm transform: aTransform at: extraOffset sourceRect: sourceRect cellSize: cellSize 
	"Warp the given using the appropriate transform and offset."
	| _gsSqueakTemp_globalRect _gsSqueakTemp_sourceQuad _gsSqueakTemp_warp _gsSqueakTemp_tfm |
	_gsSqueakTemp_tfm := aTransform.
	_gsSqueakTemp_globalRect := _gsSqueakTemp_tfm localBoundsToGlobal: sourceRect.
	_gsSqueakTemp_sourceQuad := (_gsSqueakTemp_tfm sourceQuadFor: _gsSqueakTemp_globalRect)
				collect: [:p | p - sourceRect topLeft].
	extraOffset
		ifNotNil: [_gsSqueakTemp_globalRect := _gsSqueakTemp_globalRect translateBy: extraOffset].
	_gsSqueakTemp_warp := (WarpBlt toForm: port destForm) combinationRule: Form paint;
				
				sourceQuad: _gsSqueakTemp_sourceQuad
				destRect: (_gsSqueakTemp_globalRect origin corner: _gsSqueakTemp_globalRect corner + (1 @ 1));
				 clipRect: port clipRect.
	_gsSqueakTemp_warp cellSize: cellSize.
	_gsSqueakTemp_warp sourceForm: aForm.
	_gsSqueakTemp_warp warpBits