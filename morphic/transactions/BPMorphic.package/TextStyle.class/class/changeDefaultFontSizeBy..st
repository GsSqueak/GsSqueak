instance creation
changeDefaultFontSizeBy: delta 
	"TextStyle changeDefaultFontSizeBy: 1"
	"This sample method recreates the default textStyle, with font 1 being
	a size
	larger than the smallest. It then initializes most references in the
	system as well, although most windows will have to beclosed and
	reopened to get the effect."
	| _gsSqueakTemp_allFonts |
	_gsSqueakTemp_allFonts := TextStyle default fontArray
				sorted: [:a :b | a height < b height].
	TextConstants
		at: #DefaultTextStyle
		put: (TextStyle
				fontArray: ((1 to: _gsSqueakTemp_allFonts size)
						collect: [:i | _gsSqueakTemp_allFonts atWrap: i + delta])).
	#(#ListParagraph #PopUpMenu #StandardSystemView )
		do: [:className | Smalltalk
				at: className
				ifPresent: [:aClass | aClass initialize]]