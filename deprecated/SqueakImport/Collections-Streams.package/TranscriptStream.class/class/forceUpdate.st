preferences
forceUpdate

	<preference: 'Force transcript updates to screen'
		categoryList: #(printing morphic debug)
		description: 'When enabled, transcript updates will immediately shown in the screen no matter how busy the UI process is.'
		type: #Boolean>
	^ ForceUpdate ifNil: [true]