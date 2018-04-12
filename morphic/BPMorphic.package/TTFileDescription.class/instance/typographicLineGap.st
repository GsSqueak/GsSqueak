accessing
typographicLineGap
	"Microsoft defines this as the 'true typographic metrics' of the font."
	^ sTypoLineGap
		ifNil: [lineGap]