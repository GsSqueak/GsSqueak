file list services
fileReaderServicesForDirectory: aFileDirectory
	^{
		self serviceImageImportDirectory.
		self serviceImageImportDirectoryWithSubdirectories.
	}