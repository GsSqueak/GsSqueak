stepping and presenter
step

	recorder isPaused
		ifTrue: [recordingStatusLight color: Color transparent]
		ifFalse: [recordingStatusLight color: Color red].
	recordMeter extent: (recorder meterLevel + 1) @ recordMeter height.
