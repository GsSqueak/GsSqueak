*GemStoneGUI-Squeak
messageCategoryDict

	| dict organizer |
	dict := Dictionary new.
	organizer := self organization.
	organizer categories do: [:category |
		dict at: category put: (organizer listAtCategoryNamed: category)].
	^ dict