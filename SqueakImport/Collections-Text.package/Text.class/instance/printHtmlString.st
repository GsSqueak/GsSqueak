html
printHtmlString
	"answer a string whose characters are the html representation 
	of the receiver"
	
	^ String streamContents: [:stream |
		self printHtmlOn: stream]