preferences
showHelpMenuInWorldMainDockingBar
	
	<preference: 'Show ''Help'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Help'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showHelpMenuInWorldMainDockingBar ifAbsent: [true]
