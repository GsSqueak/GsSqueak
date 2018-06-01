editing keys
changeEmphasis: characterStream 
	"Change emphasis without styling if necessary"
	styler
		ifNil: [^ super changeEmphasis: characterStream].
	^ styler
		evaluateWithoutStyling: [super changeEmphasis: characterStream]