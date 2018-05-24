preferences
showWindowsMenuInWorldMainDockingBar
	
	<preference: 'Show ''Windows'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Windows'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showWindowsMenuInWorldMainDockingBar ifAbsent: [true]
