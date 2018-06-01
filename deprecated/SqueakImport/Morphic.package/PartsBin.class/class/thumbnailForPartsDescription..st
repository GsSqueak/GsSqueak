thumbnail cache
thumbnailForPartsDescription: aPartsDescription
	"Answer a thumbnail for the given parts description creating it if necessary.  If it is created afresh, it will also be cached at this time"

	| aSymbol |
	aSymbol := aPartsDescription formalName asSymbol.
	^ Thumbnails at: aSymbol ifAbsent:
		[| aThumbnail |
		aThumbnail := Thumbnail new makeThumbnailFromForm: aPartsDescription sampleImageForm.
		self cacheThumbnail: aThumbnail forSymbol: aSymbol.
		^ aThumbnail]

"PartsBin initialize"