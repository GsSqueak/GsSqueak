copying
postCopy
	super postCopy.
	contentsAfter := contentsAfter copy.
	contentsBefore := contentsBefore copy.
	intervalAfter := intervalAfter copy.
	intervalBefore := intervalBefore copy.
	intervalBetween := intervalBetween copy.
	messageToUndo := messageToUndo copy.
	messageToRedo := messageToRedo copy