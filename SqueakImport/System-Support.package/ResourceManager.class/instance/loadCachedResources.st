loading
loadCachedResources
	"Load all the resources that we have cached locally"
	self class reloadCachedResources.
	self prioritizedUnloadedResources do:[:loc|
		self class lookupCachedResource: loc urlString ifPresentDo:[:stream|
			| resource |
			resource := resourceMap at: loc ifAbsent:[nil].
			self installResource: resource
				from: stream
				locator: loc.
			(resource isForm) ifTrue:[
				self formChangedReminder value.
				Project current world displayWorldSafely].
		].
	].