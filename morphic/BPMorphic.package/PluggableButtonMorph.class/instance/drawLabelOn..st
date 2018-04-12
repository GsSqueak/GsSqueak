drawing
drawLabelOn: aCanvas 
	| _gsSqueakTemp_fontToUse _gsSqueakTemp_labelToUse _gsSqueakTemp_colorToUse _gsSqueakTemp_labelWidth _gsSqueakTemp_layoutBounds _gsSqueakTemp_drawBlock |
	self label
		ifNil: [^ self].
	_gsSqueakTemp_layoutBounds := self layoutBounds.
	_gsSqueakTemp_labelToUse := self label asString.
	_gsSqueakTemp_fontToUse := self font.
	_gsSqueakTemp_colorToUse := self textColorToUse.
	"Support very narrow buttons. Shrink text to monogram then."
	((_gsSqueakTemp_layoutBounds width < self labelShrinkThreshold
				and: [self hResizing ~~ #shrinkWrap])
			and: [_gsSqueakTemp_labelToUse size > 3])
		ifTrue: [_gsSqueakTemp_labelToUse := _gsSqueakTemp_labelToUse first asString.
			"Show first character only."
			_gsSqueakTemp_fontToUse := _gsSqueakTemp_fontToUse emphasized: TextEmphasis bold emphasisCode].
	_gsSqueakTemp_labelWidth := _gsSqueakTemp_fontToUse widthOfString: _gsSqueakTemp_labelToUse.
	_gsSqueakTemp_drawBlock := [:c | c
				drawString: _gsSqueakTemp_labelToUse
				at: (_gsSqueakTemp_layoutBounds center x - (_gsSqueakTemp_labelWidth // 2) max: _gsSqueakTemp_layoutBounds left)
						@ (_gsSqueakTemp_layoutBounds center y - (_gsSqueakTemp_fontToUse height // 2))
				font: _gsSqueakTemp_fontToUse
				color: _gsSqueakTemp_colorToUse].
	self clipSubmorphs
		ifTrue: [aCanvas clipBy: _gsSqueakTemp_layoutBounds during: _gsSqueakTemp_drawBlock]
		ifFalse: [_gsSqueakTemp_drawBlock value: aCanvas]