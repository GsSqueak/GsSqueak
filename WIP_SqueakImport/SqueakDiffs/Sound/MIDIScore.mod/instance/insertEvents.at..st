editing
insertEvents: events at: selection

	| track selStartTime delta |
	track := tracks at: selection first.
	selection second = 0
		ifTrue: [selStartTime := 0.
				selection at: 2 put: 1]
		ifFalse: [selStartTime := (track at: selection second) time].
	track := track copyReplaceFrom: selection second to: selection second - 1
				with: (events collect: [:e | e copy]).
	track size >=  (selection second + events size) ifTrue:
		["Adjust times of following events"
		delta := selStartTime - (track at: selection second) time.
		selection second to: selection second + events size - 1 do:
			[:i | (track at: i) adjustTimeBy: delta].
		delta := (self gridToNextQuarterNote: (track at: selection second + events size - 1) endTime)
					- (track at: selection second + events size) time.
		selection second + events size to: track size do:
			[:i | (track at: i) adjustTimeBy: delta].
		].
	tracks at: selection first put: track