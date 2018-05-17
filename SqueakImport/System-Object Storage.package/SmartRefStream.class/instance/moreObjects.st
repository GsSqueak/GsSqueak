read write
moreObjects
	"Return true if there appears to be another object following this one on the file."

	| byte |
	byteStream atEnd ifTrue: [^ false].	"off end of file"
	(byte := byteStream peek) ifNil: [^ false].	"off end of file"
	byte = 33 "$! asciiValue" ifTrue: [^ false].
	byte = 0 ifTrue: [^ false].
	^ byte <= RefTypes size		"between 1 and 16"