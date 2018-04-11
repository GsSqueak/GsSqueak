initialization
addGraphicLabels
	"translate button labels"
	| _gsSqueakTemp_formTranslator |
	_gsSqueakTemp_formTranslator := NaturalLanguageFormTranslator localeID: Locale current localeID.
	#('KEEP' 'UNDO' 'CLEAR' 'TOSS' )
		do: [:label | 
			(_gsSqueakTemp_formTranslator translate: label , '-off')
				ifNil: [^ false].
			(_gsSqueakTemp_formTranslator translate: label , '-pressed')
				ifNil: [^ false]].
	#('keep:' 'undo:' 'clear:' 'toss:' )
		with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS' )
		do: [:extName :label | 
			| button newForm ext pos |
			button := submorphs
						detect: [:m | m externalName = extName]
						ifNone: [].
			button
				ifNotNil: [button removeAllMorphs.
					ext := button extent.
					pos := button position.
					(newForm := _gsSqueakTemp_formTranslator translate: label , '-off')
						ifNotNil: [button offImage: newForm].
					(newForm := _gsSqueakTemp_formTranslator translate: label , '-pressed')
						ifNotNil: [button pressedImage: newForm].
					button extent: ext.
					button position: pos]].
	^ true