class initialization
serviceOpenTrueTypeFont

	^ SimpleServiceEntry 
				provider: self 
				label: 'open true type font' translatedNoop
				selector: #openTTFFile:
				description: 'open true type font' translatedNoop