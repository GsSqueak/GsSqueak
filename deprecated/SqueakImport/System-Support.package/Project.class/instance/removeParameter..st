project parameters
removeParameter: aKey
	projectParameters ifNil:[^self].
	projectParameters removeKey: aKey ifAbsent:[].