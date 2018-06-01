as yet unclassified
readFrom: aStream

	"Read the raw font byte data"
	| fontData |
	(aStream respondsTo: #binary) ifTrue:[aStream binary].
	fontData := aStream contents asByteArray.

	fonts := self parseTTCHeaderFrom: fontData.
	^ fonts gather: [:offset |
		fontDescription := TTCFontDescription new.
		self readFrom: fontData fromOffset: offset at: EncodingTag]