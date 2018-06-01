url
grabURL: aURLString 
	"Create a BookMorph for this url and put it in the hand."
	| _gsSqueakTemp_book |
	_gsSqueakTemp_book := self new fromURL: aURLString.
	"If this book is already in, we will steal the pages out of it!!!!"
	_gsSqueakTemp_book goToPage: 1.
	"install it"
	HandMorph attach: _gsSqueakTemp_book