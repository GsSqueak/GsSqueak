private - errors
invalidInterpreterClassName
	"This should raise a nice exception to a UI"
	(VMMakerException new messageText: 'Problem - ''', interpreterClassName, ''' - is invalid as an interpreter class name: ') signal