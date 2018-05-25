loading - overlay classes
allOverlayClasses

	^ Array streamContents: [:stream |
		self allOverlayClassesIn: self fileDirectory do: [:class |
			stream nextPut: class]]