footer
printFooter: pageNumber
	"Print the footer for the given page number"
	| fPara |
	self noFooter ifTrue:[^self].
	fPara := self footerParagraph.
	fPara centered.
	fPara text: ('Page ', pageNumber printString) asText.
	fPara displayOn: form.