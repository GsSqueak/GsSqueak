as yet unclassified
respondForClass: aClass
	| writeStream |
	writeStream := WriteStream on: ''.
	aClass fileOutTo: writeStream.
	TcpSocket sendData: writeStream contents.