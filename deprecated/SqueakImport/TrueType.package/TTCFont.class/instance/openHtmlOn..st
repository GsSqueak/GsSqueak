html
openHtmlOn: aStream 
	"put on the given stream the tag to open the html  
	representation of the receiver"
	| size |
	size := self htmlSize.
	size isZero
		ifFalse: [aStream nextPutAll: '<font size="' , size asString , '">']