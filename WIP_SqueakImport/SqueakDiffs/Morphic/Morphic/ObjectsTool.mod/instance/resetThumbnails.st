menu
resetThumbnails
	"Reset the thumbnail cache"

	PartsBin clearThumbnailCache.
	modeSymbol == #categories ifTrue: [self showCategories] ifFalse: [self showAlphabeticTabs]