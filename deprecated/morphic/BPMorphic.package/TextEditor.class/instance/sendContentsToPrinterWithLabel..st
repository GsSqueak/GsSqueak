menu messages
sendContentsToPrinterWithLabel: label 
	| _gsSqueakTemp_textToPrint _gsSqueakTemp_printer |
	_gsSqueakTemp_textToPrint := paragraph text.
	_gsSqueakTemp_textToPrint size = 0
		ifTrue: [^ self inform: 'nothing to print.'].
	_gsSqueakTemp_printer := TextPrinter defaultTextPrinter.
	_gsSqueakTemp_printer
		documentTitle: (label
				ifNil: ['Untitled']).
	_gsSqueakTemp_printer printText: _gsSqueakTemp_textToPrint