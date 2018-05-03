constants
allButHashBits
	"Base header word bit fields"

	<inline: true>
	^self
		cCode: 'ALL_BUT_HASH_BITS'
		inSmalltalk: [self wordMask - HashBits]
