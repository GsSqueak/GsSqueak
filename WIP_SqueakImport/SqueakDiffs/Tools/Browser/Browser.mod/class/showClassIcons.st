preferences
showClassIcons
	<preference: 'Show class icons'
		category: 'browsing'
		description: 'When enabled, the class list will show icons for some standard types such as Morph and Magnitude.'
		type: #Boolean>
	^ShowClassIcons ifNil: [true]
