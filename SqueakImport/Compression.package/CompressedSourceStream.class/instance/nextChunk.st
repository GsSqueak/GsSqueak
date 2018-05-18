access
nextChunk
	self flag: #workAround. 	"all accessors should decode utf8"
	^super nextChunk utf8ToSqueak