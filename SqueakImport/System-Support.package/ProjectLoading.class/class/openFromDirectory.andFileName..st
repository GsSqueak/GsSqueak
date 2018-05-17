loading
openFromDirectory: aDirectory andFileName: aFileName

	Project current
		do: [| fileAndDir |
			ProgressNotification signal: '1:foundMostRecent'.
			fileAndDir := self bestAccessToFileName: aFileName andDirectory: aDirectory.
			self 
				openName: aFileName 
				stream: fileAndDir first 
				fromDirectory: fileAndDir second
				withProjectView: nil]
		withProgressInfoOn: nil
		label: 'project loading'
		