html
closeHtmlOn: aStream 
	"put on the given stream the tag to close the html 
	representation of the receiver"
	| _gsSqueakTemp_font |
	_gsSqueakTemp_font := TextStyle default fontAt: fontNumber.
	_gsSqueakTemp_font closeHtmlOn: aStream