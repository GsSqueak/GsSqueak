preferences
showDoMenuInWorldMainDockingBar
	
	<preference: 'Show ''Do'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Do'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showDoMenuInWorldMainDockingBar ifAbsent: [true]
