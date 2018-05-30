preferences
useWiggleAnimation
	
	<preference: 'Use Wiggle Animation in Modal Dialogs'
		categoryList: #(Morphic windows dialogs)
		description: 'In order to indicate that a modal dialog is waiting for a user''s input, wiggle instead of flash.'
		type: #Boolean>
	^ UseWiggleAnimation ifNil: [true]