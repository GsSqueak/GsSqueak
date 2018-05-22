preferences
windowsRaiseOnClick
	<preference: 'Windows Raise On Any Click'
		category: 'windows'
		description: 'If false, windows only raise when clicking on window decorations.'
		type: #Boolean>
	^ WindowsRaiseOnClick ifNil: [ true ]