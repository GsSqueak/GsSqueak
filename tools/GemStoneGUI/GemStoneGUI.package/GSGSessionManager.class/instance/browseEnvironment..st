toolset
browseEnvironment: anEnvironment

	^ (GSGBrowser2 forSession: self session)
		selectEnvironment: anEnvironment;
		open