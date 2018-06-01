as yet unclassified
testYesMarkerMakesItemChecked
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	itemSpec label: '<yes>on'.
	itemSpec analyzeLabel.
	self assert: itemSpec isCheckable description: 'item not checkable'.
	self assert: itemSpec isCheckable description: 'item not checked'.