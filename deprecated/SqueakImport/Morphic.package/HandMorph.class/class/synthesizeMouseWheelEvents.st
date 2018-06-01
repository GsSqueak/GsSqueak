preferences
synthesizeMouseWheelEvents
	<preference: 'Synthesize Mouse Wheel Events from Keyboard Events'
		categoryList: #(Morphic keyboard mouse)
		description: 'If enabled, convert CTRL+Up/Down (keystroke with modifier key) to mouse wheel up/down. Disable this according to the current VM behavior.'
		type: #Boolean>
	^ SynthesizeMouseWheelEvents ifNil: [true]