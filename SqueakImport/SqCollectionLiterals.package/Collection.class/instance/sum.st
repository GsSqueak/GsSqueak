*SqCollectionLiterals-*SqCollectionLiterals-math functions
sum
	"Compute the sum of all the elements in the receiver"

	^self reduce:[:a :b| a + b]
