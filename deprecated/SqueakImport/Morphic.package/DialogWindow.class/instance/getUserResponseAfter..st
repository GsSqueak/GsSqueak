running
getUserResponseAfter: seconds

	timeout := seconds + 1.
	
	self ensureSelectedButton.	
	self step.
	self updateButtonExtent.
	
	^ self getUserResponse