instance creation
open

	^ GSGRepository chooseOrOpenRepository ifNotNil: [:repository |
		ToolBuilder open: (self newOnRepository: repository)]