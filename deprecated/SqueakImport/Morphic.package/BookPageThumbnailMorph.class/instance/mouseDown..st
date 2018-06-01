event handling
mouseDown: event
	"turn the book to that page"

	"May need to lie to it so mouseUp won't go to menu that may come up during fetch of a page in doPageFlip.  (Is this really true? --tk)"

	self doPageFlip.
