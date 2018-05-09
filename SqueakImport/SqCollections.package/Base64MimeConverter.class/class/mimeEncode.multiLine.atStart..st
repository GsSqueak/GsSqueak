as yet unclassified
mimeEncode: aStream multiLine: aBool atStart: resetInput
	"Return a ReadStream of characters.  The data of aStream is encoded as 65 innocuous characters.  (See class comment). 3 bytes in aStream goes to 4 bytes in output."

	| me |
	resetInput ifTrue:[aStream position: 0].
	me := self new dataStream: aStream.
	me multiLine: aBool.
	me mimeStream: (WriteStream on: (String new: aStream size + 20 * 4 // 3)).
	me mimeEncode.
	^ me mimeStream readStream