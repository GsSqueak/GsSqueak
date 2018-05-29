instance creation
open

	^ GSGRepository chooseOrOpenRepository ifNotNil: [:repository |
		repository chooseEnvironment ifNotNil: [:environment |
			ToolBuilder open: (self newOnEnvironment: environment)]]