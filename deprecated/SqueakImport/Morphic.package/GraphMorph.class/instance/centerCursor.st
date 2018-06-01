commands
centerCursor
	"Scroll so that the cursor is as close as possible to the center of my window."

	| w |
	w := self width - (2 * borderWidth).
	self startIndex: ((cursor - (w // 2)) max: 1).
