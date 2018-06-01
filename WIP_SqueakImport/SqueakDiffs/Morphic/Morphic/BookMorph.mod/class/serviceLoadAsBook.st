fileIn/Out
serviceLoadAsBook

	^ SimpleServiceEntry 
			provider: self 
			label: 'load as book' translatedNoop
			selector: #openFromFile:
			description: 'open as bookmorph' translatedNoop