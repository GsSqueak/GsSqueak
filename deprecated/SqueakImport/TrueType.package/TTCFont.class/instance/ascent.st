accessing
ascent
	^ascent ifNil:[ascent := (ttcDescription typographicAscender * self pixelScale) truncated].