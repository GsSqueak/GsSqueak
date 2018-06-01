preferences
characterLimit
	<preference: 'Maximum number of characters in a transcript'
		categoryList: #(printing morphic debug)
		description: 'When the number of characters in a transcript exceeds this limit, characters at the start of the text are discarded.'
		type: #Number>
	^CharacterLimit ifNil: [20000]