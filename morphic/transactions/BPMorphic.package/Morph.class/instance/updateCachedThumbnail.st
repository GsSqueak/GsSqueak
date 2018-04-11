e-toy support
updateCachedThumbnail
	"If I have a cached thumbnail, then update it. Copied up from Dan's
	original version in PasteUpMorph so it can be used by all morphs."
	(self valueOfProperty: #cachedThumbnail)
		ifNotNil: [:cachedThumbnail | (cachedThumbnail respondsTo: #computeThumbnail)
				ifTrue: [cachedThumbnail computeThumbnail]
				ifFalse: [self removeProperty: #computeThumbnail]]