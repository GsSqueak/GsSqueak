testing
hasCursorMoved: cursorIndex

	^ self hasPrevious and: [self previous intervalAfter first ~= cursorIndex]