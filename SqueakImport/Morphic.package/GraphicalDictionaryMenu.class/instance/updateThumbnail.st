private
updateThumbnail
	super updateThumbnail.
	(self findA: UpdatingStringMorph)
		doneWithEdits;
		contents: (entryNames at: currentIndex)
