preferences
useSmartSearch
	<preference: 'Smart search'
		category: 'docking bars'
		description: 'When enabled, the docking bar search tries to find globals or full class names first, then tries to browse implementors, then tries to find class names if the search term starts uppercase, and finally invoke the regular message names search. When disabled, do only the last.'
		type: #Boolean>
	^ UseSmartSearch ifNil: [ true ]