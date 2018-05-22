i/o
scanFrom: aByteStream
	"During a code fileIn, we need to read in an object, and stash it in ScannedObject.  "

	| me |
	me := self on: aByteStream.
	ScannedObject := me next.
	aByteStream ascii.
	aByteStream next == $! ifFalse: [
		aByteStream close.
		self error: 'Object did not end correctly']. 
	"caller will close the byteStream"
	"HandMorph.readMorphFile will retrieve the ScannedObject"