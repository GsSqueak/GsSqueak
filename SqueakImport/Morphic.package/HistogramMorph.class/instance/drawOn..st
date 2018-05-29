drawing
drawOn: aCanvas 
	| c |
	self cachedForm 
		ifNil:
			[c := Display defaultCanvasClass extent: self bounds extent.
			c translateBy: self bounds origin negated
				during: [:tempCanvas | super drawOn: tempCanvas].
			self drawDataOn: c.
			self cachedForm: c form].
	aCanvas 
		cache: self bounds
		using: self cachedForm
		during: [:cachingCanvas | self drawDataOn: cachingCanvas].
