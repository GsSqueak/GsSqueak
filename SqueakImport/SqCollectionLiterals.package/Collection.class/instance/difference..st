enumerating
difference: aCollection
	"Answer the set theoretic difference of two collections."

	^ self reject: [:each | aCollection includes: each]
