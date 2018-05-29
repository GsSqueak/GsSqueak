event handling
handlesMouseDown: event

	^ event shiftPressed or: [flipOnClick and: [event controlKeyPressed not]]