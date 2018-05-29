event handling
doubleClick: evt
	| palette |
	palette := self standardPalette.
	((palette notNil and: [palette isInWorld]) and: [palette hasScrapsTab])
		ifTrue:
			[palette showScrapsTab]
		ifFalse:
			[self world openScrapsBook: evt].