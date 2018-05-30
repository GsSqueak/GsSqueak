initialization
addGraphicLabels
	"translate button labels"

	| formTranslator |
	formTranslator := NaturalLanguageFormTranslator localeID: (Locale current localeID).

	#('KEEP' 'UNDO' 'CLEAR' 'TOSS') do: [:label |
		(formTranslator translate: label, '-off') ifNil: [^ false].
		(formTranslator translate: label, '-pressed') ifNil: [^ false].
	].
	
	#('keep:' 'undo:' 'clear:' 'toss:') with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS') do: [:extName :label |
		| button newForm ext pos |
		button := submorphs detect: [:m | m externalName = extName] ifNone: [nil].
		button ifNotNil: [
			button removeAllMorphs.
			ext := button extent.
			pos := button position.
			(newForm := formTranslator translate: label, '-off') ifNotNil: [
				button offImage: newForm.

			].
			(newForm := formTranslator translate: label, '-pressed') ifNotNil: [
				button pressedImage: newForm.
			].
			button extent: ext.
			button position: pos.
		].
	].

	^ true.
