preferences
hideExpandButton

	<preference: 'Hide Expand Button'
		category: 'windows'
		description: 'Hides the expand ( + ) button in all window titlebars'
		type: #Boolean>
	^ HideExpandButton ifNil: [ false ]
