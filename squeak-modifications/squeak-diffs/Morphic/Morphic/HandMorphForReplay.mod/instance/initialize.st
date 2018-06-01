initialization
initialize
	"Initialize the receiver."

	super initialize.
	suspended := false.
	self showTemporaryCursor: Cursor normal
