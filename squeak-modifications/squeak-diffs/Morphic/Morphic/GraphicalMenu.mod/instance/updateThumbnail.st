event handling
updateThumbnail
	| f |
	f := formChoices at: currentIndex.
	formDisplayMorph 
		makeThumbnailFromForm: f.
