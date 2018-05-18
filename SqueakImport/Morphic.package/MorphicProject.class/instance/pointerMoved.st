utilities
pointerMoved
	"Pointer has moved during a drag operation. Perform any necessary updates.
	In Morphic, pay the price for reading the sensor directly."

	world activeHand
			newMouseFocus: nil;
			showTemporaryCursor: nil;
			flushEvents