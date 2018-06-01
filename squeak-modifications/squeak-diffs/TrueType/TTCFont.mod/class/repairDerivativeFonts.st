other
repairDerivativeFonts
	"Fix the cases where the derivatives are a different size than the originals."

	"
	TTCFont repairDerivativeFonts.
	"
	self allInstancesDo: [ :font | font pointSize: font pointSize ].
	Preferences refreshFontSettings.