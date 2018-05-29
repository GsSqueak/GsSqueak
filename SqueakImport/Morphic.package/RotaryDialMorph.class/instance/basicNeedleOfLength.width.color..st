needle graphics
basicNeedleOfLength: nLength width: nWidth color: aColor
	"make a really trivial needle as a colored rectangle"
	^RectangleMorph new extent: nWidth @ nLength; color: aColor; borderWidth: 1