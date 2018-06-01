instance creation
openOn: directory 
	^ ToolBuilder
		open: (self newOn: directory)