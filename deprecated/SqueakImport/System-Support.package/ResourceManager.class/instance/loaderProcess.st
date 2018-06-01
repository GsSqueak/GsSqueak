loading
loaderProcess
	| loader requests |
	loader := HTTPLoader default.
	requests := Dictionary new.
	self prioritizedUnloadedResources do:[:loc|
		| req |
		req := HTTPLoader httpRequestClass for: (self hackURL: loc urlString) in: loader.
		loader addRequest: req.
		requests at: req put: loc].
	[stopFlag or:[requests isEmpty]] whileFalse:[
		stopSemaphore waitTimeoutMSecs: 500.
		requests keys "need a copy" do:[:r|
			r isSemaphoreSignaled ifTrue:[
				| locator resource stream |
				locator := requests at: r.
				requests removeKey: r.
				stream := r contentStream.
				resource := resourceMap at: locator ifAbsent:[nil].
				self class cacheResource: locator urlString stream: stream.
				self installResource: resource
					from: stream
					locator: locator.
				(resource isForm) ifTrue:[
					WorldState addDeferredUIMessage: self formChangedReminder]
ifFalse: [self halt].
			].
		].
	].
	"Either done downloading or terminating process"
	stopFlag ifTrue:[loader abort].
	loaderProcess := nil.
	stopSemaphore := nil.