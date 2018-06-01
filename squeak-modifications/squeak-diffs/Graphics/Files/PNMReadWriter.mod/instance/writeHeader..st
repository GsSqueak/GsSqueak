writing
writeHeader: myType
	"this is ascii"
	stream nextPut: ($P asciiValue).
	stream nextPut: (myType asciiValue).
	stream nextPut: 10.		"nl"
	pragma ifNotNil:[
		stream nextPutAll: (pragma asByteArray).
	].
	stream nextPutAll: (cols printString) asByteArray.
	stream nextPut: 32.		" "
	stream nextPutAll: (rows printString) asByteArray.
	stream nextPut: 10.		"nl"
	depth > 1 ifTrue: [| d c maxV |
		d := {1 . 2 . 4  . 8   . 16 . 32}.
		c := {1 . 3 . 15 . 255 . 31 . 255}. 
		maxV := nil.
		1 to: d size do:[:i| ((d at: i) = depth and:[maxV = nil]) ifTrue:[maxV := c at: i]].
		stream nextPutAll: (maxV printString) asByteArray.
		stream nextPut: 10.		"nl"
	]
	