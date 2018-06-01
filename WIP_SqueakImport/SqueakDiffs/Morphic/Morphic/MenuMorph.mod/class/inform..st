utilities
inform: queryString
	"MenuMorph inform: 'I like Squeak'"
	| menu |
	(ProvideAnswerNotification signal: queryString) 
		ifNotNil:[:answer | ^ self].
	menu := self new.
	menu addTitle: queryString icon: MenuIcons confirmIcon.
	menu add: 'OK' target: self selector: #yourself.
	MenuIcons decorateMenu: menu.
	menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: true.