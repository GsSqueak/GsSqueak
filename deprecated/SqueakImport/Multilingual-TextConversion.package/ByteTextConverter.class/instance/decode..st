private
decode: aByte
	"Answer a decoded squeak character corresponding to aByte code.
	Note that aByte does necessary span in the range 0...255, since this receiver is a ByteTextEncoder."
	| code |
	((code := self class decodeTable at: 1 + aByte) = -1 or: [code = 16rFFFD]) ifTrue: [^nil].
	^Character value: code