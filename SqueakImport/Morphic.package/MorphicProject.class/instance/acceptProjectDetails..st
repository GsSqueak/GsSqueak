file in/out
acceptProjectDetails: details
	"Store project details back into a property of the world, and if a name is provided, make sure the name is properly installed in the project."

	self world setProperty: #ProjectDetails toValue: details.
	details at: 'projectname' ifPresent: [ :newName | 
		self renameTo: newName]