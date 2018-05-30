preferences
twentyFourHourClock
	<preference: '24-hour Time Clock'
		category: 'docking bars'
		description: 'Whether the clock in the world''s main docking bar should present the time in 24-hour format.'
		type: #Boolean>
	^ TwentyFourHourClock ifNil: [ true ]