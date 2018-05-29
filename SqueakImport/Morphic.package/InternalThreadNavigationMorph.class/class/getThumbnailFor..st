thumbnails
getThumbnailFor: aProject
	"Answer a thumbnail for the given project, retrieving it from a cache of such objects if possible, else creating a fresh thumbnail, storing it in the cache, and answering it."

	CachedThumbnails ifNil: [CachedThumbnails := Dictionary new].
	^CachedThumbnails
		at: aProject name
		ifAbsentPut: [self sorterFormForProject: aProject sized: 160@120]