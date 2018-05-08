enumerating
splitBy: aCollection do: aBlock
	"Split the receiver by aCollection. Evaluate aBlock with the parts.

	This method works similarly to findTokens: but
		a) takes a collection argument (i.e., 'hello<p>world<p>' splitBy: '<p>')
		b) is 'strict' in its splitting, for example:
				'a///b' findTokens: '/' ==> #('a' 'b')
				'a///b' splitBy: '/' ==> #('a' '' '' 'b')
	"

	| lastIndex nextIndex |
	lastIndex := 1.
	[nextIndex := self indexOfSubCollection: aCollection startingAt: lastIndex.
	nextIndex = 0] whileFalse:[
		aBlock value: (self copyFrom: lastIndex to: nextIndex-1).
		lastIndex := nextIndex+ aCollection size.
	].
	aBlock value: (self copyFrom: lastIndex to: self size).
