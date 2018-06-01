instance creation
installTTF: ttfFileName asTextStyle: textStyleName sizes: sizeArray
	"Sizes are in pixels."
	"TTFontReader
		installTTF: 'F:\fonts\amazon__.TTF' 
		asTextStyle: #Amazon
		sizes: #(24 60)"

	| ttf fontArray |
	ttf := self parseFileNamed: ttfFileName.
	fontArray := sizeArray collect:
		[:each |
		(ttf asStrikeFontScale: each / ttf unitsPerEm)
			name: textStyleName;
			pixelSize: each].
	TextConstants at: textStyleName asSymbol put: (TextStyle fontArray: fontArray)