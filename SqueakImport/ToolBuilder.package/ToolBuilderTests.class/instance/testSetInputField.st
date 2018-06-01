tests-input
testSetInputField
	self makeInputField.
	queries := IdentitySet new.
	self acceptWidgetText.
	self assert: (queries includes: #setText).