accessing
endTime

	^endTimeInScore ifNil: [startTimeInScore + 100]