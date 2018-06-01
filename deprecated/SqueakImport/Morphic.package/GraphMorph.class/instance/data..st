accessing
data: aCollection

	data := aCollection.
	maxVal := minVal := 0.
	data do: [:x |
		x < minVal ifTrue: [minVal := x].
		x > maxVal ifTrue: [maxVal := x]].

	self flushCachedForm.
