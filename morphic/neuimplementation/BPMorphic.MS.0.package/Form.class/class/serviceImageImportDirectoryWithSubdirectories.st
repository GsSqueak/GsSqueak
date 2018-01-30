file list services
serviceImageImportDirectoryWithSubdirectories
	"Answer a service for reading all graphics from a directory and its
	subdirectories into ImageImports"
	^ (SimpleServiceEntry
		provider: self
		label: 'import all images from here and subdirectories'
		selector: #importImageDirectoryWithSubdirectories:
		description: 'Load all graphics found in this directory and its subdirectories, adding them to the ImageImports repository.'
		buttonLabel: 'import subdirs')
		argumentGetter: [:fileList | fileList directory];
		 yourself