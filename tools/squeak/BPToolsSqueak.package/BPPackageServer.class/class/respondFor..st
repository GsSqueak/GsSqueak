as yet unclassified
respondFor: aString
	| writeStream classes |
Transcript show: 'Request for ', aString,'-package'; cr.

self assert: [(SystemOrganization categoriesMatching: aString) isNil not]. 
Transcript show: 'Request granted';cr;cr.
classes := SystemOrganization classesInCategory: aString.
classes do: [:class | 	
	Transcript cr; show: 'handling Class '.
	writeStream := WriteStream on: ''.
	class fileOutTo: writeStream.
	TcpSocket sendData: writeStream contents.
	writeStream close.].

Transcript cr;cr.
