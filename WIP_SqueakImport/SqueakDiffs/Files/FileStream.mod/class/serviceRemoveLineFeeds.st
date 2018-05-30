file reader services
serviceRemoveLineFeeds
	"Answer a service for removing linefeeds from a file"

	^ FileModifyingSimpleServiceEntry
		provider: self 
		label: 'remove line feeds' translatedNoop
		selector: #removeLineFeeds:	
		description: 'remove line feeds in file' translatedNoop
		buttonLabel: 'remove lfs' translatedNoop