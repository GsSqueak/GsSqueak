tests-window
testWindowID
	self makeWindow.
	self assert: (builder widgetAt: #window) == widget.