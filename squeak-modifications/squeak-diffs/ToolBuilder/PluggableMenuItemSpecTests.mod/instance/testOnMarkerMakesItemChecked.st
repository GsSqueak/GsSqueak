as yet unclassified
testOnMarkerMakesItemChecked
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	itemSpec label: '<on>on'.
	itemSpec analyzeLabel.
	self assert: itemSpec isCheckable description: 'item not checkable'.
	self assert: itemSpec isCheckable description: 'item not checked'.