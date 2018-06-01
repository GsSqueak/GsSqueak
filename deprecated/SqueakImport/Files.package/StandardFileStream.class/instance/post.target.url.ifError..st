browser requests
post: data target: target url: url ifError: errorBlock
	"Post data to the given URL. The returned file stream contains the reply of the server.
	If Squeak is not running in a browser evaluate errorBlock"

	self waitBrowserReadyFor: self defaultBrowserReadyWait ifFail: [^errorBlock value].
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		| request result |
		request := self primURLPost: url target: target data: data semaIndex: index.
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