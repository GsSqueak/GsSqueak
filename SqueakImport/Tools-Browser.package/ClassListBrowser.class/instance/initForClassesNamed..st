initialization
initForClassesNamed: nameList
	"Initialize the receiver for the class-name-list"

	self systemOrganizer: SystemOrganization.
	metaClassIndicated := false.
	classDisplayList := nameList copy