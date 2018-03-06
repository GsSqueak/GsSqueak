private
init: sourceStream cue: aCue failBlock: aBlock 
	self setCue: aCue.
	failBlock := aBlock.
	requestorOffset := 0.
	super scan: sourceStream.
	prevMark := hereMark := mark.
	self advance