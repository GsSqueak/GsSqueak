initialize
initializeFrom: aResourceManager
	"Initialize the receiver from aResourceManager."
	aResourceManager resourceMap keysAndValuesDo:[:loc :res|
		(res notNil)
			ifTrue:[locatorMap at: res put:  loc.
					loc localFileName: nil].
	].