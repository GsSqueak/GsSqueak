private
computeThumbnail
	"Make a thumbnail from my morph."

	(contentsMorph isKindOf: PasteUpMorph) 
		ifTrue: [thumbnail := contentsMorph smallThumbnailForPageSorter]
		ifFalse: [self updateThumbnail]