toolset
browseEnvironment: anEnvironment

	^ (GSGBrowser forSession: self session)
		selectEnvironment: anEnvironment;
		open