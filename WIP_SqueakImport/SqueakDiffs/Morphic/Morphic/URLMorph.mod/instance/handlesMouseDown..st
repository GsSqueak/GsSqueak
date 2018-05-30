event handling
handlesMouseDown: event

	^ isBookmark & event shiftPressed
