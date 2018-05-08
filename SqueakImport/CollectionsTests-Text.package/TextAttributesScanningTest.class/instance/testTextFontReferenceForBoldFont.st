testing
testTextFontReferenceForBoldFont
	"Test TextFontReference with a StrikeFont"
	| font |
	font := TTCFont familyName: 'BitstreamVeraSans' pointSize: 9 emphasis: 1.
	self doTestTextFontReferenceSerializationFor: font.
