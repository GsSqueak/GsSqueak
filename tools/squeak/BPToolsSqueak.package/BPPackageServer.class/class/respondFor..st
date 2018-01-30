as yet unclassified
respondFor: aString
	| writeStream |
Transcript show:'got called with ', aString.

	writeStream := WriteStream on: ''.
self assert: [(SystemOrganization categoriesMatching: aString) isNil not]. 
SystemOrganization fileOutCategory: aString on: writeStream.
TcpSocket sendData: writeStream contents.

writeStream close.