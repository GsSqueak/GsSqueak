menu commands
removeEntry
	baseDictionary removeKey: (entryNames at: currentIndex).
	self baseDictionary: baseDictionary.
	self updateThumbnail