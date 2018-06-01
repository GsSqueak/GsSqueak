accessing
asStringOrText
	"be fancy"
	^ self defaultFont familyName asText
		addAttribute: (TextFontReference toFont: self defaultFont);
		yourself