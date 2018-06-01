primitives
primStartRecordingDesiredSampleRate: samplesPerSec stereo: stereoFlag semaIndex: anInteger
	"Start sound recording with the given stereo setting. Use a sampling rate as close to the desired rate as the underlying platform will support. If the given semaphore index is > 0, it is taken to be the index of a Semaphore in the external objects array to be signalled every time a recording buffer is filled.
		We do *not* raise a primitiveFailed error here since this prim is called insdied a critical blcok and that often makes things painful. The only really likely case where this prim fails is a linux machine with no sound input hardware (a Raspberry Pi for example). See the startRecording method for how the failure is handled"

	self notYetImplemented.
	"self primitiveFailed"
