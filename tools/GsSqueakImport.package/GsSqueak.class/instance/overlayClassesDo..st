loading - overlay classes
overlayClassesDo: aBlock

	self allOverlayClassesIn: self fileDirectory do: [:class |
		(self shouldBeLoaded: class) ifTrue: [aBlock value: class]]