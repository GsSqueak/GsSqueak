preferences
includeControlMenu

	<preference: 'include dialog control menu'
		category: #dialogs
		description: 'If true, user dialogs include a control menu.'
		type: #Boolean>
	^IncludeControlMenu ifNil: [true]