preferences
showAppsMenuInWorldMainDockingBar
	
	<preference: 'Show ''Apps'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Apps'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showAppsMenuInWorldMainDockingBar ifAbsent: [true]
