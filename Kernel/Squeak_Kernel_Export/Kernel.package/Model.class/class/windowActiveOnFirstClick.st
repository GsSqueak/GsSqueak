preferences
windowActiveOnFirstClick
	<preference: 'Windows'' Contents Are Always Active'
		category: 'windows'
		description: 'When enabled, the widgets of background windows are sensitive to mouse input. When disabled, clicking background window will only make it the active window, without changing, for example, selections in lists or text fields.'
		type: #Boolean>
		
	^ WindowActiveOnFirstClick ifNil: [ false ]