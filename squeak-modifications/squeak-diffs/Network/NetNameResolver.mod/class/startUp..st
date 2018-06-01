system startup
startUp: resuming
	"Set the UseOldNetwork flag if ipv6 primitives are not present or if the EnableIPv6 preference is not set."

	resuming ifTrue: [self initializeOldNetworkFlag]