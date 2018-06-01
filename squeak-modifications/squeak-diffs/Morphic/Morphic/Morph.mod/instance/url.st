accessing
url
	"If I have been assigned a url, return it.  For PasteUpMorphs mostly."
	| sq |
	(sq := self sqkPage) ifNotNil: [^ sq url].
	^ self valueOfProperty: #url
		