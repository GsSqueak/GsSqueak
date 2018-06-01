menu messages
sendContentsToPrinterWithLabel: label
	| textToPrint printer |
	textToPrint := paragraph text.
	textToPrint size = 0 ifTrue: [^self inform: 'nothing to print.'].
	printer := TextPrinter defaultTextPrinter.
	printer documentTitle: (label ifNil: ['Untitled']).
	printer printText: textToPrint