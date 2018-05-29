player process
startPlayerProcessBufferSize: bufferSize rate: samplesPerSecond stereo: stereoFlag sound: aSound
	"Start the sound player process. Terminate the old process, if any."
	"SoundPlayer startPlayerProcessBufferSize: 1000 rate: 11025 stereo: false"

	self stopPlayerProcess.
	aSound
		ifNil:[ActiveSounds := OrderedCollection new]
		ifNotNil:[ActiveSounds := OrderedCollection with: aSound].
	Buffer := SoundBuffer newStereoSampleCount: (bufferSize // 4) * 4.
	LastBuffer ifNotNil:[LastBuffer := SoundBuffer basicNew: Buffer basicSize].
	PlayerSemaphore := Semaphore forMutualExclusion.
	SamplingRate := samplesPerSecond.
	Stereo := stereoFlag.
	SoundSupported := true. "Assume so"
	UseReadySemaphore := true.  "set to false if ready semaphore not supported by VM"
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		ReadyForBuffer := semaphore.
		self primSoundStartBufferSize: Buffer stereoSampleCount
			rate: samplesPerSecond
			stereo: Stereo
			semaIndex: index ].
	"Check if sound start prim was successful"
	SoundSupported ifFalse:[
		Smalltalk unregisterExternalObject: ReadyForBuffer.
		ReadyForBuffer := nil.
		^self ].
	UseReadySemaphore
		ifTrue: [PlayerProcess := [SoundPlayer playLoop] newProcess]
		ifFalse: [PlayerProcess := [SoundPlayer oldStylePlayLoop] newProcess].
	UseReverb ifTrue: [self startReverb].

	PlayerProcess
		name: 'Sound Player (', ActiveSounds size asString, ')';
		priority: Processor userInterruptPriority;
		resume