thumbnail cache
thumbnailForInstanceOf: aMorphClass
	"Answer a thumbnail for a stand-alone instance of the given class, creating it if necessary.  If it is created afresh, it will also be cached at this time"

	^ Thumbnails at: aMorphClass name ifAbsent:
		[| aThumbnail |
		aThumbnail := Thumbnail new makeThumbnailFromForm: aMorphClass newStandAlone imageForm.
		self cacheThumbnail: aThumbnail forSymbol: aMorphClass name.
		^ aThumbnail]

"PartsBin initialize"