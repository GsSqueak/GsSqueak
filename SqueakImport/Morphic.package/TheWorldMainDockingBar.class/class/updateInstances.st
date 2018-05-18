events
updateInstances
	"The class has changed, time to update the instances"

	self setTimeStamp.
	Project current in: [:project |
		project isMorphic ifTrue: [
			project assureMainDockingBarPresenceMatchesPreference]].