tests-button
testButtonWidgetID
	self makeButton.
	self assert: (builder widgetAt: #button) == widget.