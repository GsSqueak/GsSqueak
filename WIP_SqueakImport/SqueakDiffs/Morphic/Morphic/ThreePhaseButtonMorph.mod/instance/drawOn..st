drawing
drawOn: aCanvas

	| imageToUse |
	
	imageToUse := self currentImage.
	
	imageToUse ifNotNil: [aCanvas translucentImage: imageToUse at: bounds origin].	
	
	self label ifNotNil: [:lbl |
		aCanvas
			drawString: lbl
			at: bounds origin + (imageToUse ifNil: [0@0] ifNotNil: [:form | (form width @ 0) + (3@0)])
			font: self font
			color: self textColor].