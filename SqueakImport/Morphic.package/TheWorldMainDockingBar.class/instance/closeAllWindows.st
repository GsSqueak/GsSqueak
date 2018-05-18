submenu - windows
closeAllWindows
	self allVisibleWindows do: [:each |
		each model canDiscardEdits ifTrue: [each delete]]