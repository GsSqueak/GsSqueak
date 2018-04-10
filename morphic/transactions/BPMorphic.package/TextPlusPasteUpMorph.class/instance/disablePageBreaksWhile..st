as yet unclassified
disablePageBreaksWhile: aBlock 
	| _gsSqueakTemp_save _gsSqueakTemp_result |
	_gsSqueakTemp_save := showPageBreaks.
	showPageBreaks := false.
	_gsSqueakTemp_result := aBlock value.
	showPageBreaks := _gsSqueakTemp_save.
	^ _gsSqueakTemp_result