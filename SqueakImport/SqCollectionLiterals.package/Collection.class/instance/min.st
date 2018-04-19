*SqCollectionLiterals-*SqCollectionLiterals-math functions
min
	"Answer the minimum value in the collection.  The collection must be non-empty and contain 'compatible' Magnitudes (eg: don't try this with a collection containing both Dates and Characters)."
	^ self inject: self anyOne into: [:min :each | min min: each]
