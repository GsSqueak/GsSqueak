thumbnails
cacheThumbnailFor: aProject
	"Save a thumbnail  of the given project in my thumbnail cache."

	| form |
	CachedThumbnails ifNil: [CachedThumbnails := Dictionary new].
	CachedThumbnails
		at: aProject name
		put: (form := self sorterFormForProject: aProject sized: 160 @ 120).
	^ form
	