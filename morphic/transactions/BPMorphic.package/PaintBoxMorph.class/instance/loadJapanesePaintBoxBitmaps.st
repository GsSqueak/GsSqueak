initialization
loadJapanesePaintBoxBitmaps
	"
	PaintBoxMorph new loadJapanesePaintBoxBitmaps
	"
	| _gsSqueakTemp_formTranslator _gsSqueakTemp_form _gsSqueakTemp_bb |
	self position: 0 @ 0.
	_gsSqueakTemp_formTranslator := NaturalLanguageFormTranslator
				localeID: (LocaleID isoString: 'ja').
	_gsSqueakTemp_form := Form fromFileNamed: 'offPaletteJapanese(children).form'.
	#('keep:' 'undo:' 'clear:' 'toss:' )
		with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS' )
		do: [:extName :label | 
			_gsSqueakTemp_bb := (self submorphs
						detect: [:e | e externalName = extName]) bounds.
			_gsSqueakTemp_formTranslator
				name: label , '-off'
				form: (_gsSqueakTemp_form copy: _gsSqueakTemp_bb)].
	_gsSqueakTemp_form := Form fromFileNamed: 'pressedPaletteJapanese(children).form'.
	#('keep:' 'undo:' 'clear:' 'toss:' )
		with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS' )
		do: [:extName :label | 
			_gsSqueakTemp_bb := (self submorphs
						detect: [:e | e externalName = extName]) bounds.
			_gsSqueakTemp_formTranslator
				name: label , '-pressed'
				form: (_gsSqueakTemp_form copy: _gsSqueakTemp_bb)]