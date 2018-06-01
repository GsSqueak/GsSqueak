html
printHtmlOn: aStream 
	
	(HtmlReadWriter on: aStream)
		nextPutText: self.