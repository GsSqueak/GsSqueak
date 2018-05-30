*Morphic-MorphicExtras-postscript generation
encodePostscriptOn: aStream 
	self unhibernate.

	"since current Postscript support treats 8-bit forms as 0 to 255 gray scale, convert
	to 16 first so we get more faithful results"

	self depth <= 8 ifTrue: [^(self asFormOfDepth: 16) encodePostscriptOn: aStream].

	^ self printPostscript: aStream operator: (self depth = 1
			ifTrue: ['imagemask']
			ifFalse: ['image'])