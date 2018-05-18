drag'n'drop
dragPassengerFor: item inMorph: dragSource
	^self directory fullNameFor: ((self fileNameFromFormattedItem: item contents copy)
		copyReplaceAll: self folderString with: '').
