class initialization
noColorCaption
	| formTranslator |
	formTranslator := NaturalLanguageFormTranslator localeID: Locale current localeID.
	^ (formTranslator translate: 'no color')
		ifNil: [Form
				extent: 34 @ 9
				depth: 1
				fromArray: #(0 0 256 0 256 0 3808663859 2147483648 2491688266 2147483648 2491688266 0 2491688266 0 2466486578 0 0 0 )
				offset: 0 @ 0]
