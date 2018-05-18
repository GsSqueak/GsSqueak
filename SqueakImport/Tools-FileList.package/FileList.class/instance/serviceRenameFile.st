own services
serviceRenameFile

	^ (SimpleServiceEntry 
			provider: self 
			label: 'rename' translatedNoop
			selector: #renameFile 
			description: 'rename file' translatedNoop)