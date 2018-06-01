tests-input
testInputWidgetID
	self makeInputField.
	self assert: (builder widgetAt: #input) == widget.