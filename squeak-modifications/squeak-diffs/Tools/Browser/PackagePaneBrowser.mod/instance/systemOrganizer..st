initialize-release
systemOrganizer: aSystemOrganizer 
	"Initialize the receiver as a perspective on the system organizer, 
	aSystemOrganizer. Typically there is only one--the system variable 
	SystemOrganization."

	super systemOrganizer: aSystemOrganizer .
	packageListIndex := 0