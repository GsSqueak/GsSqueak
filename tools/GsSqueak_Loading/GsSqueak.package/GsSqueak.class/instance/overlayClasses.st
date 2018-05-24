loading - overlay classes
overlayClasses

	^ Array streamContents: [:stream |
		self overlayClassesDo: [:class |
			stream nextPut: class]]