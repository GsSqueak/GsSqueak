shrinking
shrink
	"Clean up everything we know how to clean up that can be restored."
	"Prepare unloading"
	self zapMVCprojects.
	Flaps disableGlobalFlaps: false.
	self unloadReloadablePackages.
	"Post-unload aggressive cleanup"
	Smalltalk cleanUp: true.
	SystemOrganization removeSystemCategory: 'UserObjects'.
	Smalltalk at: #ScheduledControllers ifPresent: [Smalltalk at: #ScheduledControllers put: nil].
	Smalltalk garbageCollect
