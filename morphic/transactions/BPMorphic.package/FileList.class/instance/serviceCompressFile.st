own services
serviceCompressFile
	"Answer a service for compressing a file"
	^ SimpleServiceEntry
		provider: self
		label: 'compress' translatedNoop
		selector: #compressFile
		description: 'compress file' translatedNoop
		buttonLabel: 'compress' translatedNoop