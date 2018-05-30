as yet unclassified
testByDefaultNotCheckable
	| itemSpec |
	itemSpec := PluggableMenuItemSpec new.
	self deny: itemSpec isCheckable.