private
widgetAt: id ifAbsent: aBlock
	widgets ifNil:[^aBlock value].
	^widgets at: id ifAbsent: aBlock