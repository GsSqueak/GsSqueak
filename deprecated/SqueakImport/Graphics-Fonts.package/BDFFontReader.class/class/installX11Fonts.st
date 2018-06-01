resource download
installX11Fonts "BDFFontReader installX11Fonts"
	"Installs previously-converted .sf2 fonts into the TextConstants dictionary.  This makes them available as TextStyles everywhere in the image."

	| families |
	families := #( 'Courier' 'Helvetica' 'LucidaBright' 'Lucida' 'LucidaTypewriter' 'NewCenturySchoolbook' 'TimesRoman' ).

	families do: [:family | | fontArray textStyle |
		fontArray := StrikeFont readStrikeFont2Family: family.
		textStyle := TextStyle fontArray: fontArray.
		TextConstants at: family asSymbol put: textStyle.
	].
