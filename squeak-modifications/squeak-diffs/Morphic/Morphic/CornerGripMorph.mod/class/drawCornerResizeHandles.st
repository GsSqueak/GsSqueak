preferences
drawCornerResizeHandles
	<preference: 'Draw Corner Resize Handles'
		category: 'windows'
		description: 'Set whether the resize handles on windows should be drawn on the window frame. This does not enable nor disable the resizing function'
		type: #Boolean>
	^ DrawCornerResizeHandles ifNil: [ false ]