math functions
max
	"Answer the maximum value in the collection.  The collection must be non-empty and contain 'compatible' Magnitudes (eg: don't try this with a collection containing both Dates and Characters)."
	^ self inject: self anyOne into: [:max :each | max max: each]
