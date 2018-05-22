initialization
setFileStream: aStream
	"Used to initialize a spawned file editor.  Sets directory too."
	self directory: aStream directory.
	fileName := aStream localName.
	pattern := '*'.
	listIndex := 1.  "pretend a file is selected"
	aStream close.
	brevityState := #needToGetBrief.
	self 
		changed: #contents ; 
		changed: #labelString