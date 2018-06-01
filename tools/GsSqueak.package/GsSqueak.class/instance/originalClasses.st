loading - original classes
originalClasses

	^ Array streamContents: [:stream |
		self originalClassesDo: [:class |
			stream nextPut: class]]