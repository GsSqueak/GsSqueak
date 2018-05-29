private
keepIndexInView: index

	| w newStart |
	w := bounds width - (2 * borderWidth).
	index < startIndex ifTrue: [
		newStart := index - w + 1.
		^ self startIndex: (newStart max: 1)].
	index > (startIndex + w) ifTrue: [
		^ self startIndex: (index min: data size)].
