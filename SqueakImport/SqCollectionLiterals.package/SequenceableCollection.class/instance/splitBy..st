*SqCollectionLiterals-*SqCollectionLiterals-enumerating
splitBy: aCollection
	"Answer the receiver, split by aCollection.

	This method works similarly to findTokens: but
		a) takes a collection argument (i.e., 'hello<p>world<p>' splitBy: '<p>')
		b) is 'strict' in its splitting, for example:
				'a///b' findTokens: '/' ==> #('a' 'b')
				'a///b' splitBy: '/' ==> #('a' '' '' 'b')
	"

	^Array streamContents:[:stream|
		self splitBy: aCollection do:[:each| stream nextPut: each].
	].
