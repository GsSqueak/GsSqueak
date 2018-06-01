*Morphic-MorphicExtras-initialization
stepListSummary
	^ String streamContents:
		[:aStream |
			aStream nextPutAll: stepList size printString, ' items in steplist:'.
			stepList do:
				[:anElement | aStream nextPutAll: anElement receiver printString]]

"Transcript cr show: self currentWorld stepListSummary"