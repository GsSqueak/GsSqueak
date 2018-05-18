thumbnail
updateThumbnailUrl
	"If I have a cached thumbnail, then update it's urls."
	| cachedThumbnail |

	(cachedThumbnail := self valueOfProperty: #cachedThumbnail) ifNotNil:
		[(cachedThumbnail respondsTo: #computeThumbnail) 
			ifTrue: [cachedThumbnail pageMorph: self url inBook: owner url]
			ifFalse: [self removeProperty: #computeThumbnail]].
			"Test and removal are because the thumbnail is being replaced 
			by another Morph.  We don't know why.  Need to fix that at 
			the source."