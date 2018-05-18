own services
serviceGet
	"Answer a service for getting the entire file"

	^  (SimpleServiceEntry 
			provider: self 
			label: 'get entire file' translatedNoop
			selector: #get
			description: 'if the file has only been partially read in, because it is very large, read the entire file in at this time.' translatedNoop)