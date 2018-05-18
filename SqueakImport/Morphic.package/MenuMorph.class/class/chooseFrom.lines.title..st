utilities
chooseFrom: aList lines: linesArray title: queryString
	"Choose an item from the given list. Answer the index of the selected item."
	"MenuMorph
		chooseFrom: #('Hello' 'World' 'Here' 'We' 'Go')
		lines: #(2 4)
		title: 'What''s up?'"
	| menu aBlock result |
	(ProvideAnswerNotification signal: queryString) ifNotNil:[:answer | 
		1 to: aList size do:[:i| (aList at: i) = answer ifTrue:[^i]].
		^0].
	aBlock := [:v| result := v].
	menu := self new.
	menu addTitle: queryString.
	1 to: aList size do:[:i| 
		menu add: (aList at: i) asString target: aBlock selector: #value: argument: i.
		(linesArray includes: i) ifTrue:[menu addLine]
	].
	MenuIcons decorateMenu: menu.
	result := 0.
	menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: true.
	^result