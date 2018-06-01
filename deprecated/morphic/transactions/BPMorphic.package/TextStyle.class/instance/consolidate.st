private
consolidate
	"If this style includes any fonts that are also in the default style,
	then replace them with references to the default ones."
	"
	TextStyle allInstancesDo: [:s | s == TextStyle default ifFalse: [s
	consolidate]] "
	| _gsSqueakTemp_defFonts _gsSqueakTemp_font |
	_gsSqueakTemp_defFonts := TextStyle default fontArray.
	1
		to: fontArray size
		do: [:i | 
			_gsSqueakTemp_font := fontArray at: i.
			1
				to: _gsSqueakTemp_defFonts size
				do: [:j | (_gsSqueakTemp_font name asUppercase copyWithout: Character space)
							= ((_gsSqueakTemp_defFonts at: j) name asUppercase copyWithout: Character space)
						ifTrue: [fontArray
								at: i
								put: (_gsSqueakTemp_defFonts at: j)]]]