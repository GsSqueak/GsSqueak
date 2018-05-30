scrolling
scrollBy: delta
	"Move the contents in the direction delta."

	self flag: #negated. "mt: Who uses this and why is does the expected behavor negate the delta?"
	self vScrollBar scrollBy: delta y negated.
	self hScrollBar scrollBy: delta x negated.