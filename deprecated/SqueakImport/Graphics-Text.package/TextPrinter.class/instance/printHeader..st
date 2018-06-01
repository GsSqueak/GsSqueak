header
printHeader: pageNumber
	"Print the header for the given page number"
	| fPara |
	self noHeader ifTrue:[^self].
	fPara := self headerParagraph.
	fPara centered.
	fPara text: self documentTitle asText.
	fPara displayOn: form.