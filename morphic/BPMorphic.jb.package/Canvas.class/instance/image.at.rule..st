drawing-obsolete
image: aForm at: aPoint rule: combinationRule 
	"Note: This protocol is deprecated. Use one of the explicit image
	drawing messages (#paintImage, #drawImage) instead."
	self
		image: aForm
		at: aPoint
		sourceRect: aForm boundingBox
		rule: combinationRule