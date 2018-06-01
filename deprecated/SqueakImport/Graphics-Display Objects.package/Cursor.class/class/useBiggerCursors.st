preferences
useBiggerCursors

	<preference: 'Use bigger mouse cursors'
		category: 'mouse'
		description: 'If true, mouse cursors are scaled up'
		type: #Boolean>
	^ UseBiggerCursors ifNil: [false]