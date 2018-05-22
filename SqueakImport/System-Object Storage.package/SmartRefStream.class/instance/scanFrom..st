read write
scanFrom: aByteStream
	"During a code fileIn, we need to read in an object, and stash it in ScannedObject.  "

	self setStream: aByteStream reading: true.
	ScannedObject := self next.
	byteStream ascii.
	byteStream next == $! ifFalse: [
		byteStream close.
		self error: 'Object did not end correctly']. 
	"caller will close the byteStream"
	"HandMorph.readMorphFile will retrieve the ScannedObject"