show & hide
adjustPositionAfterHidingFlap
	"we add the width of flap itself to our referent, to reflect the actual width from the edge of the screen, including the space we leave for other flaps. see also ViewerFlapTab>>fitOnScreen"
	self flag: #todo.
	self referent width: self referent width + self width.
	super adjustPositionAfterHidingFlap.