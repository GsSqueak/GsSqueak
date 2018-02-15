as yet unclassified
respondForClass: aClass
	| writeStream |
	writeStream := WriteStream on: ''.
	BPFileOuter fileOut: aClass To: writeStream.
	TcpSocket sendData: writeStream contents.