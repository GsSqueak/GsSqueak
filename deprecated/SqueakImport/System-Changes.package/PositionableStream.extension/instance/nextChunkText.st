*System-Changes-fileIn/Out
nextChunkText
	"Deliver the next chunk as a Text.  Decode the following ]style[ chunk if present.  Position at start of next real chunk."
	| string runs peek pos |
	"Read the plain text"
	string := self nextChunk.
	
	"Test for ]style[ tag"
	pos := self position.
	peek := self skipSeparatorsAndPeekNext.
	peek = $] ifFalse: [self position: pos. ^ string asText].  "no tag"
	(self upTo: $[) = ']style' ifFalse: [self position: pos. ^ string asText].  "different tag"

	"Read and decode the style chunk"
	runs := RunArray scanFrom: self basicNextChunk readStream.

	^ Text basicNew setString: string setRunsChecking: runs.
