private
anchorAndRunModeless: aHand
	"If user clicks on the drag-dot of a modal picker,
	anchor it, and change to modeless operation."

	aHand showTemporaryCursor: nil.  "revert to normal cursor"
	self initializeModal: false; originalColor: originalColor.  "reset as modeless"
	aHand flushEvents.  "Drop any events gathered during modal loop"
	aHand position: Sensor cursorPoint; grabMorph: self.  "Slip into drag operation"
