menu
changeTextColor
	"Change the color of the receiver -- triggered, e.g. from a menu"

	self openATextPropertySheet.
">>>>>
	ColorPickerMorph new
		choseModalityFromPreference;
		sourceHand: self activeHand;
		target: self;
		selector: #textColor:;
		originalColor: self textColor;
		putUpFor: self near: self fullBoundsInWorld
<<<<"