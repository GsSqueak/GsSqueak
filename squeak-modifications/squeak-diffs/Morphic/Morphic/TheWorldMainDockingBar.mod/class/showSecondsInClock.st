preferences
showSecondsInClock
	<preference: 'Show seconds in clock'
		category: 'docking bars'
		description: 'Whether the clock in the world''s main docking bar should display seconds.'
		type: #Boolean>
	^ ShowSecondsInClock ifNil: [ true ]