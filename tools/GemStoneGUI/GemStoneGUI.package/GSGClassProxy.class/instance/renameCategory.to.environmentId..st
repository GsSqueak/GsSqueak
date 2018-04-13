interface - messages
renameCategory: oldName to: newName environmentId: envId

	self interface
		class: self
		renameMessageCategory: oldName
		to: newName
		env: envId