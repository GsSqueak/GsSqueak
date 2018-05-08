testing
testTextFontReferenceTTC
	"n.b. A TextFontReference specifies font height only, which is not sufficient
	to identify a unique TTCFont. Here we test only that the font height of the
	selected font matches the TextFontReference specification."

	"(self selector: #testTextFontReferenceTTC) debug"

	"Test TextFontReference with a TTCFont"
	| font |
	font := TTCFont familyName: 'BitstreamVeraSans' pointSize: 9 emphasis: 0.
	self doTestTextFontReferenceTTCFor: font.