preferences
autoIndent
	<preference: 'Auto indent on new line'
		categoryList: #('Morphic' 'editing')
		description: 'When true, tabs will be inserted after pressing Enter | Return such that the new line will be indented equally with the previous line.'
		type: #Boolean>
	^ AutoIndent ifNil: [ true ]