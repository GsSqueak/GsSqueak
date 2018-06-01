ansi protocol
= aDateAndTimeOrTimeStamp 
	self == aDateAndTimeOrTimeStamp ifTrue: [ ^ true ].
	((aDateAndTimeOrTimeStamp isKindOf: self class)
		or: [aDateAndTimeOrTimeStamp isKindOf: DateAndTime orOf: TimeStamp])
			ifFalse: [ ^ false ].
	^ self offset = aDateAndTimeOrTimeStamp offset
		ifTrue: [ self hasEqualTicks: aDateAndTimeOrTimeStamp ]
		ifFalse: [ self asUTC hasEqualTicks: aDateAndTimeOrTimeStamp asUTC ]