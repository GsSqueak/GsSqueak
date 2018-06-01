private
textSegmentsDo: blockForLineDestPivotAngle 
	| segments segSpec |
	(segments := container textSegments) ifNil: [^self].
	1 to: lines size
		do: 
			[:i | 
			segSpec := segments at: i.
			blockForLineDestPivotAngle 
				value: (lines at: i)
				value: (segSpec first)
				value: (segSpec second)
				value: (segSpec third)]