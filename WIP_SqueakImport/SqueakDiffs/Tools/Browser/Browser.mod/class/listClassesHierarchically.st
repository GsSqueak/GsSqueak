preferences
listClassesHierarchically
	<preference: 'List classes hierarchically'
		category: 'browsing'
		description: 'When enabled, the class list in the browser is arranged and indented with regard to the class hierarchy.'
		type: #Boolean>
	^ListClassesHierarchically ifNil: [false]
