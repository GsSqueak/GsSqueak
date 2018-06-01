instance creation
fromPartString: aString
	"This method allows for easy creation of MIME documents 
	representing parts in a multipart MIME document"
	
	^ self new initializeFromString: aString