tests-text
testGetTextColor
	self makeText.
	queries := IdentitySet new.
	self changed: #getColor.
	self assert: (queries includes: #getColor).
	self assert: self widgetColor = self getColor.