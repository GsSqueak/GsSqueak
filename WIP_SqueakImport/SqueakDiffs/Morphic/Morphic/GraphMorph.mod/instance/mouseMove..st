event handling
mouseMove: evt

	| x w |
	x := evt cursorPoint x - (bounds left + borderWidth).
	w := self width - (2 * borderWidth).

	self changed.
	x < 0 ifTrue: [
		cursor := startIndex + (3 * x).
		cursor := (cursor max: 1) min: data size.
		^ self startIndex: cursor].
	x > w ifTrue: [
		cursor := startIndex + w + (3 * (x - w)).
		cursor := (cursor max: 1) min: data size.
		^ self startIndex: cursor - w].

	cursor := ((startIndex + x) max: 1) min: data size.
