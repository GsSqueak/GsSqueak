preferences
clickOnLabelToEdit

	<preference: 'Click On Label To Edit'
		category: 'windows'
		description: 'If true, a click on the label of a system window lets you edit it'
		type: #Boolean>
	^ ClickOnLabelToEdit ifNil: [false].
