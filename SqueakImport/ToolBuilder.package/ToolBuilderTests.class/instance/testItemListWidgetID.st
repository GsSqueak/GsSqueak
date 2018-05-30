tests-lists
testItemListWidgetID
	self makeItemList.
	self assert: (builder widgetAt: #list) == widget.