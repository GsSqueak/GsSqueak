preferences
showMainMenuInWorldMainDockingBar
	
	<preference: 'Show ''Main'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Main'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showMainMenuInWorldMainDockingBar ifAbsent: [true]
