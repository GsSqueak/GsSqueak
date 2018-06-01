fileIn/fileOut
fileOutOn: aStream 
	"self current fileOutOn: Transcript. Transcript endEntry"
	self fileOutHeaderOn: aStream.
	self fileOutOn: aStream keys: nil