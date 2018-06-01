submenu - windows
closeAllWindowsLike: window
	self closeAllWindowsBut: window.
	window model canDiscardEdits ifTrue: [window delete]