as yet unclassified
testOffMarkerMakesItemChecked
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	itemSpec label: '<off>off'.
	itemSpec analyzeLabel.
	self assert: itemSpec isCheckable description: 'item not checkable'.
	self deny: itemSpec checked description: 'item checked'.