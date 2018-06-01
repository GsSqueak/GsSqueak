initialization
addTextualLabels
	"translate button labels"

	#('keep:' 'undo:' 'clear:' 'toss:') with: #('KEEP' 'UNDO' 'CLEAR' 'TOSS') do: [:extName :label |
		| button |
		button := submorphs detect: [:m | m externalName = extName] ifNone: [nil].
		button ifNotNil: [
			button removeAllMorphs.
			button addMorph: (TextMorph new 
				contentsWrapped: (Text string: label translated
					attributes: {
						TextAlignment centered. 
						TextEmphasis bold.
						TextFontReference toFont:
							(Preferences standardPaintBoxButtonFont)});
				bounds: (button bounds translateBy: 0@3);
				lock)]]