utilities
confirm: queryString trueChoice: trueChoice falseChoice: falseChoice 
	"Put up a yes/no menu with caption queryString. The actual wording for the two choices will be as provided in the trueChoice and falseChoice parameters. Answer true if the response is the true-choice,  false if it's the false-choice. This is a modal question -- the user must respond one way or the other."
	"MenuMorph 
		confirm: 'Are you hungry?'  
		trueChoice: 'yes, I''m famished'  
		falseChoice: 'no, I just ate'"
	| menu aBlock result |
	(ProvideAnswerNotification signal: queryString) 
		ifNotNil:[:answer | ^ trueChoice = answer].
	aBlock := [:v| result := v].
	menu := self new.
	menu addTitle: queryString icon: MenuIcons confirmIcon.
	menu add: trueChoice target: aBlock selector: #value: argument: true.
	menu add: falseChoice target: aBlock selector: #value: argument: false.
	MenuIcons decorateMenu: menu.
	[menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: true.
	result == nil] whileTrue.
	^result