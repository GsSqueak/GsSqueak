tests-lists
testListWidgetID
	self makeList.
	self assert: (builder widgetAt: #list) == widget.