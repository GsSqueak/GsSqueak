submenu - windows
allWindowsLike: window
	^ self allVisibleWindows reject: [:each | each model ~= window model or: [each = window]]