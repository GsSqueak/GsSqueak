events
pointGriddedFromEvent: evt

	| relativePt |
	relativePt := evt cursorPoint - self position.
	^ (relativePt x truncateTo: magnification)@(relativePt y truncateTo: magnification)
