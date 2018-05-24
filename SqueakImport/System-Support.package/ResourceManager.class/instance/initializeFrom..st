initialize
initializeFrom: aCollector
	"Initialize the receiver from the given resource collector. None of the resources have been loaded yet, so make register all resources as unloaded."
	aCollector stubMap keysAndValuesDo:[:stub :res|
		| newLoc |
		newLoc := stub locator.
		resourceMap at: newLoc put: res.
		"unloaded add: newLoc."
	].