converting
unescapePercentsWithTextEncoding: encodingName 
	"decode string including %XX form"
	
	| converter |
	converter := (TextConverter newForEncoding: encodingName)
		ifNil: [ TextConverter newForEncoding: nil ].
	^self unescapePercentsWithTextConverter: converter