private
hasSmallerTicksThan: aDateAndTime
	
	^ jdn < aDateAndTime julianDayNumber or:
		[ jdn > aDateAndTime julianDayNumber
			ifTrue: [ false ]
			ifFalse:
				[ seconds < aDateAndTime secondsSinceMidnight or:
					[ seconds > aDateAndTime secondsSinceMidnight
						ifTrue: [ false ]
						ifFalse: [ nanos < aDateAndTime nanoSecond ] ] ] ]