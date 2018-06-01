miscellaneous
keyLike: aString withTrailing: trailerString satisfying: aBlock
	"Return a key like (aString, trailerString) that satisfies aBlock.  The block should provide a test for acceptability -- typically the test is about whether the key is already in use.  aBlock should return a boolean.  8/11/96 sw"

	| stemAndSuffix suffix stem composite |
	composite := aString, trailerString.
	(aBlock value: composite) ifTrue: [^ composite].
	stemAndSuffix := aString stemAndNumericSuffix.
	suffix := stemAndSuffix last + 1.
	stem := stemAndSuffix first.
	[aBlock value: (composite := stem, suffix printString, trailerString)]
		whileFalse:
			[suffix := suffix + 1].
	^ composite
