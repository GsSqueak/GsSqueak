thumbnail cache
thumbnailForQuad: aQuint color: aColor
	"Answer a thumbnail for a morph obtaining as per the quintuplet provided, creating the thumbnail if necessary.  If it is created afresh, it will also be cached at this time"

	| aThumbnail aSymbol formToThumbnail labeledItem |
	aSymbol := aQuint third.
	Thumbnails at: aSymbol ifPresent: [ :thumb | ^thumb ].
	formToThumbnail := aQuint at: 5 ifAbsent: [].
	formToThumbnail ifNil: [
		labeledItem := (Smalltalk at: aQuint first) perform: aQuint second.
		formToThumbnail := labeledItem imageForm: 32 backgroundColor: aColor forRectangle: labeledItem fullBounds.
		formToThumbnail replaceColor: aColor withColor: Color transparent.
		labeledItem delete.
	].

	aThumbnail := Thumbnail new makeThumbnailFromForm: formToThumbnail.
	self cacheThumbnail: aThumbnail forSymbol: aSymbol.
	^ aThumbnail

"PartsBin initialize"