thumbnail
updateThumbnailUrlInBook: bookUrl 
	"If I have a cached thumbnail, then update it's urls."
	(self valueOfProperty: #cachedThumbnail)
		ifNotNil: [:cachedThumbnail | (cachedThumbnail respondsTo: #computeThumbnail)
				ifTrue: [cachedThumbnail pageMorph: self url inBook: bookUrl]
				ifFalse: [self removeProperty: #computeThumbnail]]