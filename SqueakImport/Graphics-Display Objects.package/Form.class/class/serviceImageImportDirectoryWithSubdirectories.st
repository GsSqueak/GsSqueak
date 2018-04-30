file list services
serviceImageImportDirectoryWithSubdirectories
	"Answer a service for reading all graphics from a directory and its subdirectories into ImageImports"

	^(SimpleServiceEntry
			provider: self 
			label: 'import all images from here and subdirectories' translatedNoop
			selector: #importImageDirectoryWithSubdirectories:
			description: 'Load all graphics found in this directory and its subdirectories, adding them to the ImageImports repository.' translatedNoop
			buttonLabel: 'import subdirs' translatedNoop)
			argumentGetter: [ :fileList | fileList directory ];
			yourself
