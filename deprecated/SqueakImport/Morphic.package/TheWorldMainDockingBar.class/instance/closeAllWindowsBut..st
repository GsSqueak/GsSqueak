submenu - windows
closeAllWindowsBut: window
	(self allOtherWindowsLike: window) do: [:each |
		each model canDiscardEdits ifTrue: [each delete]]