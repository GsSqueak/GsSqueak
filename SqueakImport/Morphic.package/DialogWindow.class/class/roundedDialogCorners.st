preferences
roundedDialogCorners
	<preference: 'Rounded Dialog Corners'
		categoryList: #(windows dialogs)
		description: 'If true, dialog windows will have rounded corners'
		type: #Boolean>
	^ RoundedDialogCorners ifNil: [ true ]