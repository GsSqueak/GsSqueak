as yet unclassified
respondForClass: aClass
	| writeStream |
	writeStream := WriteStream on: ''.
	aClass fileOutTopazStyleTo: writeStream.
	TcpSocket sendData: writeStream contents.