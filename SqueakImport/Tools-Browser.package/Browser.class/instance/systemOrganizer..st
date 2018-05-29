initialize-release
systemOrganizer: aSystemOrganizer
	"Initialize the receiver as a perspective on the system organizer, 
	aSystemOrganizer. Typically there is only one--the system variable 
	SystemOrganization."
	
	contents := nil.
	systemOrganizer := aSystemOrganizer.
	selectedSystemCategory := nil.
	selectedMessageCategoryName := nil.
	selectedClassName := nil.
	selectedMessageName := nil.
	metaClassIndicated := false.
	self setClassOrganizer.
	self editSelection: #none.