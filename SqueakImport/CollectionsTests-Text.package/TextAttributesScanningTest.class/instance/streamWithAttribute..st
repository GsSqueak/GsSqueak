testing
streamWithAttribute: att
	"Encode a TextAttribute on a Stream, and return a readStream on it"
	| strm |
	strm := (String new: 16) writeStream.
	att writeScanOn: strm.
	^strm readStream