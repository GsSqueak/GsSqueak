preferences
sendMouseWheelToKeyboardFocus
	<preference: 'Send Mouse Wheel Events to Keyboard Focus'
		categoryList: #(Morphic keyboard mouse)
		description: 'If enabled, follow the behavior known from Microsoft Windows, where the mouse wheel works for the widget that has the keyboard focus. If disabled, follow the Mac OS style, where the mouse wheel is send to the widget under the mouse position'
		type: #Boolean>
	^ SendMouseWheelToKeyboardFocus ifNil: [true]