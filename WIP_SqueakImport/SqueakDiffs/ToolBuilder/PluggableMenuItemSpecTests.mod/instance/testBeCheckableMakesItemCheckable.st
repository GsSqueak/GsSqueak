as yet unclassified
testBeCheckableMakesItemCheckable
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	itemSpec beCheckable.
	self assert: itemSpec isCheckable description: 'Item not checkable'.