math functions
min
	"Answer the minimum value in the collection.  This optimized version only looks at each unique value once."
	^contents keys inject: contents keys anyOne into: [:min :each | min min: each]
