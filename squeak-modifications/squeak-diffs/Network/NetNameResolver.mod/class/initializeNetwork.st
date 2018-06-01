network initialization
initializeNetwork
	"Initialize the network drivers and record the semaphore to be used by the resolver. Do nothing if the network is already initialized. Signal NoNetworkError if network initialization fails."
	"NetNameResolver initializeNetwork" 

	self resolverStatus = ResolverUninitialized
		ifFalse: [^HaveNetwork := true].  "network is already initialized"

	HaveNetwork := false.	"in case abort"
	Smalltalk newExternalSemaphoreDo: [ :semaphore :index |
		ResolverSemaphore := semaphore.
		"result is nil if network initialization failed, self if it succeeds"
		(self primInitializeNetwork: index)
			ifNil: [
				Smalltalk unregisterExternalObject: ResolverSemaphore.
				ResolverSemaphore := nil.
				NoNetworkError signal: 'failed network initialization']
			ifNotNil: [ HaveNetwork := true ] ].

	self initializeOldNetworkFlag