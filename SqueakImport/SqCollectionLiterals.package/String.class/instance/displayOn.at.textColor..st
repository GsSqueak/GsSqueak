displaying
displayOn: aDisplayMedium at: aPoint textColor: aColor
	"Show a representation of the receiver as a DisplayText at location aPoint on aDisplayMedium, rendering the text in the designated color"

	(self asDisplayText foregroundColor: (aColor ifNil: [Color black]) backgroundColor: Color white)
		displayOn: aDisplayMedium at: aPoint