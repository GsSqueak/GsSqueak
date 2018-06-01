submenu - windows
allOtherWindowsLike: window
	^ self allVisibleWindows reject: [:each |
		each model name ~= window model name or: [each = window]]