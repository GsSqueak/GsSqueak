fileout
deleteExistingFiles
	
	(self fileDirectory entryAt: 'properties.json') delete.
	(self fileDirectory entryAt: 'README.md') delete	 