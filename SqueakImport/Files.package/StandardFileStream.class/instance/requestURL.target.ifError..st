browser requests
requestURL: url target: target ifError: errorBlock
	"Request to go to the target for the given URL.
	If Squeak is not running in a browser evaluate errorBlock"

	self waitBrowserReadyFor: self defaultBrowserReadyWait ifFail: [^errorBlock value].
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		| request result |
		request := self primURLRequest: url target: target semaIndex: index.
		request ifNil: [
			Smalltalk unregisterExternalObject: semaphore.
			^errorBlock value ].
		[ semaphore wait. "until something happens"
			result := self primURLRequestState: request.
			result == nil ] whileTrue.
		self primURLRequestDestroy: request.
		Smalltalk unregisterExternalObject: semaphore ].
	fileID ifNil: [ ^nil ].
	self register.
	name := url.
	rwmode := false.
	buffer1 := String new: 1.
	self enableReadBuffering