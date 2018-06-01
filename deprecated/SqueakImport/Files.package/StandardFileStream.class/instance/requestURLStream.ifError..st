browser requests
requestURLStream: url ifError: errorBlock
	"Request a FileStream for the given URL.
	If Squeak is not running in a browser evaluate errorBlock"
	"FileStream requestURLStream:'http://www.squeak.org'"

	self waitBrowserReadyFor: self defaultBrowserReadyWait ifFail: [^errorBlock value].
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		| request result |
		request := self primURLRequest: url semaIndex: index.
		request ifNil: [
			Smalltalk unregisterExternalObject: semaphore.
			^errorBlock value ].
		[ semaphore wait. "until something happens"
			result := self primURLRequestState: request.
			result == nil ] whileTrue.
		result ifTrue: [ fileID := self primURLRequestFileHandle: request ].
		self primURLRequestDestroy: request.
		Smalltalk unregisterExternalObject: semaphore ].
	fileID ifNil: [ ^nil ].
	self register.
	name := url.
	rwmode := false.
	buffer1 := String new: 1.
	self enableReadBuffering