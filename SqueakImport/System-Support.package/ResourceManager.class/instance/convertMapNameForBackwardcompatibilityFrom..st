backward-compatibility
convertMapNameForBackwardcompatibilityFrom: aString 
	(Smalltalk platformName = 'Mac OS' 
		and: ['10*' match: Smalltalk osVersion]) 
			ifTrue: [^aString convertFromWithConverter: ShiftJISTextConverter new].
	^aString convertFromSystemString