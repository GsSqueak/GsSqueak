menu
changeTabText
	"Allow the user to change the text on the tab"
	| _gsSqueakTemp_reply |
	_gsSqueakTemp_reply := UIManager default request: 'new wording for this tab:' translated initialAnswer: self existingWording.
	_gsSqueakTemp_reply isEmptyOrNil
		ifTrue: [^ self].
	self changeTabText: _gsSqueakTemp_reply