converting
asArray
	"Overriden for speed"

	| result size |
	result := Array new: (size := self size).
	result
		replaceFrom: 1
		to: size
		with: array
		startingAt: firstIndex.
	^result