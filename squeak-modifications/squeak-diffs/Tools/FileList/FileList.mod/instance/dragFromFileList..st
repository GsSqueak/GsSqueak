file list
dragFromFileList: anIndex 
	^ self directory entryAt: (self fileNameFromFormattedItem: (self fileList at: self fileListIndex))