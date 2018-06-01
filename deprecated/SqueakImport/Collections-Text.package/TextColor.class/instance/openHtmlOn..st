html
openHtmlOn: aStream 
	"put on the given stream the tag to open the html  
	representation of the receiver"
	aStream nextPutAll: '<font color="#' , color printHtmlString , '">'