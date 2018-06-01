utilities
fontSizeSummary
	"Open a text window with a simple summary of the available sizes in
	each of the fonts in the system."
	"TextStyle fontSizeSummary"
	(StringHolder new contents: self fontSizeSummaryContents)
		openLabel: 'Font styles and sizes' translated