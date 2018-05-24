loading - original classes
originalClassesDo: aBlock

	self allOriginalClassesDo: [:class |
		(self shouldBeLoaded: class) ifTrue: [
			aBlock value: class]]