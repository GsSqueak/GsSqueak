button actions
openBrowser

	self repository chooseEnvironment ifNotNil: [:environment |
		self browseEnvironment: environment]