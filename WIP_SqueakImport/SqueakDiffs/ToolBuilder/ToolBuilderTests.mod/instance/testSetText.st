tests-text
testSetText
	self makeText.
	queries := IdentitySet new.
	self acceptWidgetText.
	self assert: (queries includes: #setText).