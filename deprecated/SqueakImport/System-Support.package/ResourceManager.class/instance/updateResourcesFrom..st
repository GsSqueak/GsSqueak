loading
updateResourcesFrom: aCollector
	"We just assembled all the resources in a project.
	Include all that were newly found"
	self reset. "start clean"
	aCollector stubMap keysAndValuesDo:[:stub :res|
		"update all entries"
		resourceMap at: stub locator put: res.
		loaded add: stub locator.
	].