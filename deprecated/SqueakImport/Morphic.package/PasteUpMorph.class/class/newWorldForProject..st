project
newWorldForProject: projectOrNil 
	"Return a new pasteUpMorph configured as a world (ie project notNil).
	projectOrNil is no longer used."

	^ self new initForProject: WorldState new