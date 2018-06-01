as yet unclassified
myWorldChanged
	| trans |
	trans := self myTransformation.
	self changed.
	self layoutChanged.
	trans ifNotNil:[
		trans extentFromParent: self innerBounds extent.
		bounds := bounds topLeft extent: trans extent + (borderWidth * 2).
	].
	self changed.
