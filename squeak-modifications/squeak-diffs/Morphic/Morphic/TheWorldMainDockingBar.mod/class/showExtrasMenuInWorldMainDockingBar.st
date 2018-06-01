preferences
showExtrasMenuInWorldMainDockingBar
	
	<preference: 'Show ''Extras'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Extras'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showExtrasMenuInWorldMainDockingBar ifAbsent: [true]
