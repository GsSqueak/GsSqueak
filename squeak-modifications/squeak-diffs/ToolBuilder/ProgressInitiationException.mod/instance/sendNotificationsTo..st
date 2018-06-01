initialize-release
sendNotificationsTo: aNewBlock

	self resume: (
		workBlock value: [ :barVal |
			aNewBlock value: minVal value: maxVal value: barVal
		]
	)
