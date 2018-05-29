recording controls
startRecording
	"Turn on the sound input driver and start the recording process. Initially, recording is paused.
	If the primStartRecordingDesiredSampleRate:... fails it almost certainly means we have no usable 
	sound input device. Rather than having the prim raise a failure error we let it quietly do nothing
	(since I hate trying to debug errors inside a critical block) and check the actual sampling rate later.
	If the sampling rate is 0 we know the startup failed and raise an application level Signal to let any
	user code know about the problem. 
	You might think we should also use the stopRecording message to close things down cleanly but
	that simply results in astorm of attempts to start recording so it is simpler to let it be deluded. An
	attempts to start recording will repeat the test and thereby handle any plug-in hardware etc."

	recordLevel ifNil: [recordLevel := 0.5].  "lazy initialization"
	CanRecordWhilePlaying ifFalse: [SoundPlayer shutDown: true].
	recordProcess ifNotNil: [self stopRecording].
	paused := true.
	meteringBuffer := SoundBuffer newMonoSampleCount: 1024.
	meterLevel := 0.
	self allocateBuffer.
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		bufferAvailableSema := semaphore.
		self primStartRecordingDesiredSampleRate: samplingRate asInteger
			stereo: stereo
			semaIndex: index ].
	RecorderActive := true.
	samplingRate := self primGetActualRecordingSampleRate.
	samplingRate = 0 ifTrue: [ Warning signal: 'SoundRecorder: unable to connect to sound input device'].
	self primSetRecordLevel: (1000.0 * recordLevel) asInteger.
	recordProcess := [self recordLoop] newProcess.
	recordProcess priority: Processor userInterruptPriority.
	recordProcess resume