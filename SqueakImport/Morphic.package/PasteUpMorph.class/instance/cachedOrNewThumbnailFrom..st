misc
cachedOrNewThumbnailFrom: newThumbnail
	"If I have a cached thumbnail, and it is of the desired extent, then ruturn it.
	Otherwise produce one in newThumbnail and return it (after caching).
	This code parallels what happens in page: to match resultant extent."
	| cachedThumbnail scale ext |
	scale := newThumbnail height / self fullBounds height.
	ext := (self fullBounds extent * scale) truncated.
	(cachedThumbnail := self valueOfProperty: #cachedThumbnail) ifNotNil:
		[cachedThumbnail extent = ext ifTrue: [^ cachedThumbnail]].
	self setProperty: #cachedThumbnail toValue: (newThumbnail page: self).
	^ newThumbnail