accessing
adjustToRename: newName from: oldName
	"Adjust to the fully qualified URL for this resource."
	self urlString: (self urlString copyReplaceAll: oldName with: newName)