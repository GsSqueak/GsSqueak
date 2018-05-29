menu
changeTabText
	"Allow the user to change the text on the tab"

	| reply |
	reply := UIManager default
		request: 'new wording for this tab:' translated
		initialAnswer: self existingWording.
	reply isEmptyOrNil ifTrue: [^ self].
	self changeTabText: reply.
