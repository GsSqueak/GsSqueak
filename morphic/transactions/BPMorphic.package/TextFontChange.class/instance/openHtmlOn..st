html
openHtmlOn: aStream 
	"put on the given stream the tag to open the html 
	representation of the receiver"
	| _gsSqueakTemp_font |
	_gsSqueakTemp_font := TextStyle default fontAt: fontNumber.
	_gsSqueakTemp_font openHtmlOn: aStream