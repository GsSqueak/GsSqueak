access
readStamp
	"Get the time stamp of this method off the file"

	| item tokens anIndex |
	stamp := ''.
	file ifNil: [^ stamp].
	file position: position.
	item := file nextChunk.
	tokens := Scanner new scanTokens: item.
	tokens size < 3 ifTrue: [^ stamp].
	anIndex := tokens indexOf: #stamp: ifAbsent: [^ stamp].
	^ stamp := tokens at: (anIndex + 1).
