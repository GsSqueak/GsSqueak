class initialization
localeChanged
	| formTranslator |
	formTranslator := NaturalLanguageFormTranslator localeID: Locale current localeID.
	TransText := formTranslator translate: 'translucent'.
	TransText
		ifNil: [TransText := Form
						extent: 63 @ 8
						depth: 1
						fromArray: #(4194306 1024 4194306 1024 15628058 2476592640 4887714 2485462016 1883804850 2486772764 4756618 2485462016 4748474 1939416064 0 0 )
						offset: 0 @ 0].
	TransText := ColorForm mappingWhiteToTransparentFrom: TransText