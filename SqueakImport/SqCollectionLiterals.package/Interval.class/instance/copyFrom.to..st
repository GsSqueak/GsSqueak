copying
copyFrom: startIndex to: stopIndex
	(startIndex = 1 and: [stopIndex = self size]) ifTrue: [^self].
	stopIndex < startIndex ifTrue: [^self copyEmpty].
	^(self at: startIndex) to: (self at: stopIndex) by: step