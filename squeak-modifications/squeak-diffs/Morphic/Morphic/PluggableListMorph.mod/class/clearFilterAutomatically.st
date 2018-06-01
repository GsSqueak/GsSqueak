preferences
clearFilterAutomatically
	<preference: 'Filterable Lists Clear Automatically'
		category: 'scrolling'
		description: 'When using the Filterable Lists option, if this option is also selected, then the filter will be cleared as soon as the list loses keyboard focus.'
		type: #Boolean>
	^ ClearFilterAutomatically ifNil: [ true ]