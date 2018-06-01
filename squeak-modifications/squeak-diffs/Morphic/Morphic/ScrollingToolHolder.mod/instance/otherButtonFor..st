accessing
otherButtonFor: aButton
	"Find the corresponding button for either a pickup or a stamp button"

	| ii |
	(ii := pickupButtons indexOf: aButton) > 0 ifTrue: [^ stampButtons at: ii].
	(ii := stampButtons indexOf: aButton) > 0 ifTrue: [^ pickupButtons at: ii].
	self error: 'stamp button not found'.