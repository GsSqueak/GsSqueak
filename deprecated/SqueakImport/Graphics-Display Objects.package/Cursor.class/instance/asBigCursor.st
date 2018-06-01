converting
asBigCursor
	"Big cursors are 32 bits deep (ARGB premultiplied)"
	depth = 32
		ifFalse: [^self enlargedBy: 2].
	^self