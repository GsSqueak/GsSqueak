preferences
menuRequestUpdatesSelection

	<preference: 'Menu request updates list/tree selection'
		category: #Morphic
		description: 'When invoking a menu, this will for the current selection by default. If the mouse cursor it at a different location, however, this preference will update the selection before showing the menu if enabled.'
		type: #Boolean>
	^ MenuRequestUpdatesSelection ifNil: [ false ]