as yet unclassified
testNoMarkerMakesItemChecked
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	itemSpec label: '<no>no'.
	itemSpec analyzeLabel.
	self assert: itemSpec isCheckable description: 'item not checkable'.
	self deny: itemSpec checked description: 'item checked'.