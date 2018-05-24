stream access
readWriteStreamDo: aBlock 
	"Open a read-write stream on my contents and answer the value of aBlock with it, ensuring the stream is closed."
	^ FileStream
		detectFile: self readWriteStream
		do: aBlock