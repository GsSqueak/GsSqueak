accessing
maxAscii
	"Answer the max. code point in this font. The name of this method is historical."
	^maxAscii ifNil:[ttcDescription size].