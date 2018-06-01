preferences
doubleClickOnLabelToExpand

	<preference: 'Double-Click On Label To Expand'
		category: 'windows'
		description: 'Activates expansion through double-clicking on the window label area. This mimics the behavior in many current operating systems'
		type: #Boolean>
	^ DoubleClickOnLabelToExpand ifNil: [true].
