fileIn/fileOut
fileOutOn: aStream 
	"self current fileOutOn: Transcript. Transcript endEntry"
	self fileOutOn: aStream keys: nil withBOM: true.
