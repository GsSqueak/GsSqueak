file list services
serviceImageImportAndShowImports
	"Answer a service for reading a graphic into ImageImports"

	^	SimpleServiceEntry
			provider: self 
			label: 'read graphic into and show ImageImports'
			selector: #importImageAndShowImports:
			description: 'Load a graphic, placing it in the ImageImports repository and browse that repository.'
			buttonLabel: 'import'