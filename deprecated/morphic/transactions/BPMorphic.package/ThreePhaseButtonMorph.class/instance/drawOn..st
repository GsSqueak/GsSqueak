drawing
drawOn: aCanvas 
	| _gsSqueakTemp_imageToUse |
	_gsSqueakTemp_imageToUse := self currentImage.
	_gsSqueakTemp_imageToUse
		ifNotNil: [aCanvas translucentImage: _gsSqueakTemp_imageToUse at: bounds origin].
	self label
		ifNotNil: [:lbl | aCanvas
				drawString: lbl
				at: bounds origin
						+ (_gsSqueakTemp_imageToUse
								ifNil: [0 @ 0]
								ifNotNil: [:form | form width @ 0 + (3 @ 0)])
				font: self font
				color: self textColor]