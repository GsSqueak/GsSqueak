html
closeHtmlOn: aStream 
	"put on the given stream the tag to close the html  
	representation of the receiver"
	emphasisCode = 1
		ifTrue: [aStream nextPutAll: '</b>'].
	emphasisCode = 2
		ifTrue: [aStream nextPutAll: '</i>'].
	emphasisCode = 4
		ifTrue: [aStream nextPutAll: '</u>'].
	emphasisCode = 16
		ifTrue: [aStream nextPutAll: '</s>'].