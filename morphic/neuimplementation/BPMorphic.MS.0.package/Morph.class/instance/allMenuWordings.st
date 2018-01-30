menus
allMenuWordings
	| tempMenu |
	tempMenu := self buildHandleMenu: self currentHand.
	tempMenu
		allMorphsDo: [:m | m step].
	"Get wordings current"
	^ tempMenu allWordings