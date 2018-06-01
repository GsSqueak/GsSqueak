stepping and presenter
step

	(state == #record and: [voiceRecorder notNil]) ifTrue: [
		recordMeter width: (voiceRecorder meterLevel + 1).
	].
