file list services
serviceImageImportDirectory
	"Answer a service for reading a graphic into ImageImports"

	^(SimpleServiceEntry
			provider: self 
			label: 'import all images from this directory' translatedNoop
			selector: #importImageDirectory:
			description: 'Load all graphics found in this directory, adding them to the ImageImports repository.' translatedNoop
			buttonLabel: 'import dir' translatedNoop)
			argumentGetter: [ :fileList | fileList directory ];
			yourself
