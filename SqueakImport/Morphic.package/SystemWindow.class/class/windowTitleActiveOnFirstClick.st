preferences
windowTitleActiveOnFirstClick
	<preference: 'Windows'' Controls Are Always Active'
		category: 'windows'
		description: '... except for grips and splitters. Those remain always active and an option to bring the window to the front.'
		type: #Boolean>
	^ WindowTitleActiveOnFirstClick ifNil: [ true ]