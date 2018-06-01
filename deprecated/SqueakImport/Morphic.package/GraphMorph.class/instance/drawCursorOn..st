private
drawCursorOn: aCanvas

	| ptr x r c |
	ptr := (cursor asInteger max: 1) min: data size.
	c := cursorColor.
	((ptr > 1) and: [ptr < data size]) ifTrue: [
		(data at: ptr) sign ~= (data at: ptr + 1) sign
			ifTrue: [c := cursorColorAtZeroCrossings]].
	r := self innerBounds.
	x := r left + ptr - startIndex.
	((x >= r left) and: [x <= r right]) ifTrue: [
		aCanvas fillRectangle: (x@r top corner: x + 1@r bottom) color: c].
