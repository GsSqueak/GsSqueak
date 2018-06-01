layout
updateMinimumExtent
	| _gsSqueakTemp_hMin _gsSqueakTemp_vMin |
	self label isMorph
		ifTrue: [^ self minimumExtent: self label minExtent].
	_gsSqueakTemp_hMin := _gsSqueakTemp_vMin := 0.
	self hResizing ~~ #spaceFill
		ifTrue: [_gsSqueakTemp_hMin := self font widthOfString: self label].
	self vResizing ~~ #spaceFill
		ifTrue: [_gsSqueakTemp_vMin := self font height].
	_gsSqueakTemp_hMin := _gsSqueakTemp_hMin + (2 * self borderStyle width).
	_gsSqueakTemp_vMin := _gsSqueakTemp_vMin + (2 * self borderStyle width).
	self layoutInset isRectangle
		ifTrue: [_gsSqueakTemp_hMin := _gsSqueakTemp_hMin + self layoutInset left + self layoutInset right.
			_gsSqueakTemp_vMin := _gsSqueakTemp_vMin + self layoutInset top + self layoutInset bottom]
		ifFalse: [self layoutInset isPoint
				ifTrue: [_gsSqueakTemp_hMin := _gsSqueakTemp_hMin + (2 * self layoutInset x).
					_gsSqueakTemp_vMin := _gsSqueakTemp_vMin + (2 * self layoutInset y)]
				ifFalse: [_gsSqueakTemp_hMin := _gsSqueakTemp_hMin + (2 * self layoutInset).
					_gsSqueakTemp_vMin := _gsSqueakTemp_vMin + (2 * self layoutInset)]].
	self minimumExtent: _gsSqueakTemp_hMin @ _gsSqueakTemp_vMin.
	"Since we have no submorphs, we have to resize here if we want to
	shrink wrap."
	self hResizing == #shrinkWrap
		ifTrue: [self width: _gsSqueakTemp_hMin].
	self vResizing == #shrinkWrap
		ifTrue: [self height: _gsSqueakTemp_vMin]