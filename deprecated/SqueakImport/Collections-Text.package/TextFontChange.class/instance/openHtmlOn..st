html
openHtmlOn: aStream 
	"put on the given stream the tag to open the html  
	representation of the receiver"
	| font |
	font := TextStyle default fontAt: fontNumber.
	font openHtmlOn: aStream