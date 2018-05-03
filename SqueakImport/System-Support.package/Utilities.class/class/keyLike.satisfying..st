miscellaneous
keyLike: aString satisfying: aBlock
	"Return a key like aString that satisfies aBlock.  The block should provide a test for acceptability -- typically the test is about whether the key is already in use.  aBlock should return a boolean.  8/11/96 sw"

	| stemAndSuffix suffix stem newKey |
	(aBlock value: aString) ifTrue: [^ aString].
	stemAndSuffix := aString stemAndNumericSuffix.
	suffix := stemAndSuffix last + 1.
	stem := stemAndSuffix first.
	[aBlock value: (newKey := stem, suffix printString)]
		whileFalse:
			[suffix := suffix + 1].
	^ newKey
