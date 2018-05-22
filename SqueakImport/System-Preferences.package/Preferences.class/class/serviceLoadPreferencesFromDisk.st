support - file list services
serviceLoadPreferencesFromDisk
	^ SimpleServiceEntry 
		provider: self 
		label: 'load preferences from a saved file'
		selector: #restorePreferencesFromDisk:
		description: 'restore all saved personal preference settings'
		buttonLabel: 'load preferences'