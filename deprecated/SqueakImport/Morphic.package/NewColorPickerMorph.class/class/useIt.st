accessing
useIt
	<preference: 'Use the new color-picker'
		category: 'colors'
		description: 'When true, a newly-enhanced color-picker is used.'
		type: #Boolean>
	^ UseIt ifNil: [ false ]