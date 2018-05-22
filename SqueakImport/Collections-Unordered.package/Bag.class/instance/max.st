math functions
max
	"Answer the maximum value in the collection.  This optimized version only looks at each unique value once."
	^contents keys inject: contents keys anyOne into: [:max :each | max max: each]
