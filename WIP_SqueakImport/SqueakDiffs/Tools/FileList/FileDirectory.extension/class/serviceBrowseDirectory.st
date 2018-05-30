*Tools-FileList
serviceBrowseDirectory

	^ (SimpleServiceEntry
		provider: FileList
		label: 'browse directory'
		selector: #openOn:
		description: 'browse directory'
		buttonLabel: 'browse')
			argumentGetter:  [:directory | directory];
			yourself