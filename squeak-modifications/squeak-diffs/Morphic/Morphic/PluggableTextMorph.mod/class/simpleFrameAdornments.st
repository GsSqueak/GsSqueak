frame adornments
simpleFrameAdornments
	<preference: 'Simple Frame Adornments'
		category: 'Morphic'
		description: 'When true, use a simple rectangle border as feedback for indicating unsaved changes in text editors, otherwise use a small triangle in the upper-right corner'
		type: #Boolean>
	^SimpleFrameAdornments ifNil:[false]