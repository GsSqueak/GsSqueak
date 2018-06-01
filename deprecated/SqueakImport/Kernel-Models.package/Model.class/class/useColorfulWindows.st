preferences
useColorfulWindows
	<preference: 'Use colorful windows'
		categoryList: #(Morphic windows)
		description: 'When true, windows have colors specific to their kind.'
		type: #Boolean>
	^UseColorfulWindows ifNil:[true]