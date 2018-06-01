preferences
showToolsMenuInWorldMainDockingBar
	
	<preference: 'Show ''Tools'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Tools'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showToolsMenuInWorldMainDockingBar ifAbsent: [true]
