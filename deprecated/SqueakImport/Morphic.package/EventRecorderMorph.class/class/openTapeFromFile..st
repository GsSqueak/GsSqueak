instance creation
openTapeFromFile: fullName
	"Open an eventRecorder tape for playback."
 
	(self new) readTape: fullName; openInWorld