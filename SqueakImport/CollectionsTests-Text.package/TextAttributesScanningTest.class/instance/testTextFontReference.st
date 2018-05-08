testing
testTextFontReference
	"Test TextFontReference with a StrikeFont"
	| font |
	font := TTCFont familyName: 'BitstreamVeraSans' pointSize: 9 emphasis: 0.
	self doTestTextFontReferenceSerializationFor: font.
