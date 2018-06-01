e-toy support
updateCachedThumbnail
	"If I have a cached thumbnail, then update it.  Copied up from Dan's original version in PasteUpMorph so it can be used by all morphs."
	| cachedThumbnail |

	(cachedThumbnail := self valueOfProperty: #cachedThumbnail) ifNotNil:
		[(cachedThumbnail respondsTo: #computeThumbnail) 
			ifTrue: [cachedThumbnail computeThumbnail]
			ifFalse: [self removeProperty: #computeThumbnail]].
		"Test and removal are because the thumbnail is being replaced by another Morph.  We don't know why.  Need to fix that at the source."