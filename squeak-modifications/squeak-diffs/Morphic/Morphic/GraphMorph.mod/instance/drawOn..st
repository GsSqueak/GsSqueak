drawing
drawOn: aCanvas 
	| c |
	cachedForm isNil 
		ifTrue: 
			[c := Display defaultCanvasClass extent: bounds extent.
			c translateBy: bounds origin negated
				during: [:tempCanvas | self drawDataOn: tempCanvas].
			cachedForm := c form].
	aCanvas 
		cache: bounds
		using: cachedForm
		during: [:cachingCanvas | self drawDataOn: cachingCanvas].
	self drawCursorOn: aCanvas