events
updateInstances
	"The class has changed, time to update the instances"

	self setTimeStamp.
	
	"current project does not exist yet during GsSqueak bootstrap"
	Project current ifNil: [
	    ^ self ].
	Project current in: [:project |
		project isMorphic ifTrue: [
			project assureMainDockingBarPresenceMatchesPreference]].
