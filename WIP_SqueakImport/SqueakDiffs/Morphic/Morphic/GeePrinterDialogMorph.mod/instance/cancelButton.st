as yet unclassified
cancelButton
	^ self
		buttonNamed: 'Cancel'
		action: #doCancel
		color: Color lightRed
		help: 'Cancel this printing operation.'