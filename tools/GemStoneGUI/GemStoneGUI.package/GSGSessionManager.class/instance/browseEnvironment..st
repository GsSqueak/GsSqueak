toolset
browseEnvironment: anEnvironment

	^ (GSGBrowser2 forSession: self)
		selectEnvironment: anEnvironment;
		open