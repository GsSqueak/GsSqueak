preferences
useRetractableScrollBars
	
	<preference: 'Use retractable scrollbars'
		category: #scrolling
		description: 'When enabled, scrollbars are hidden when scroll pane is not focused.'
		type: #Boolean>
	^ UseRetractableScrollBars ifNil: [false]