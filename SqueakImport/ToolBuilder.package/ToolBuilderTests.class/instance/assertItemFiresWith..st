tests-menus
assertItemFiresWith: aBlock
	| spec |
	spec := builder pluggableMenuSpec new.
	spec model: self.
	aBlock value: spec.
	widget := builder build: spec.
	queries := IdentitySet new.
	self fireMenuItemWidget.
	self assert: (queries includes: #fireMenuAction)