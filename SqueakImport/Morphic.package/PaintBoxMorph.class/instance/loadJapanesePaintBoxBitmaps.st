initialization
loadJapanesePaintBoxBitmaps
"
	PaintBoxMorph new loadJapanesePaintBoxBitmaps.
"

	| formTranslator form bb |
	self position: 0@0.
	formTranslator := NaturalLanguageFormTranslator localeID: (LocaleID isoString: 'ja').
	form := Form fromFileNamed: 'offPaletteJapanese(children).form'.

	#('keep:' 'undo:' 'clear:' 'toss:') with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS') do: [:extName :label |
		bb := (self submorphs detect: [:e | e externalName = extName]) bounds.
		formTranslator name: label, '-off' form: (form copy: bb)
	].


	form := Form fromFileNamed: 'pressedPaletteJapanese(children).form'.
	#('keep:' 'undo:' 'clear:' 'toss:') with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS') do: [:extName :label |
		bb := (self submorphs detect: [:e | e externalName = extName]) bounds.
		formTranslator name: label, '-pressed' form: (form copy: bb)
	].
