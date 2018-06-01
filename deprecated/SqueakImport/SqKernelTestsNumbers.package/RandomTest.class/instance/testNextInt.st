tests
testNextInt
	"Generate many integer values from a small range, and see if they are distributed equally on that range. This is not an exact test, but it's good enough to find obvious errors in the generator."

	| random |
	random := Random seed: 1234567812345678.
	#(
		2 100000
		3 200000
		10 300000
		100 400000
	) groupsDo: [ :bucketCount :runs |
		| buckets |
		buckets := Array new: bucketCount withAll: 0.
		runs timesRepeat: [
			| next | 
			next := random nextInt: bucketCount.
			buckets at: next put: (buckets at: next) + 1 ].
		buckets do: [ :each | 
			self assert: (each / (runs / bucketCount) between: 0.95 and: 1.05) ] ]