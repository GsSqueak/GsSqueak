preferences
includeCloseButton

	<preference: 'include dialog close button'
		category: #dialogs
		description: 'If true, user dialogs include a close button.'
		type: #Boolean>
	^IncludeCloseButton ifNil: [true]