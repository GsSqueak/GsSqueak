other
updateLabel

	| label |
	(label := self findA: StringMorph) ifNil: [^ self].
	label contents: (self controllerName: controller), ', ch: ', (channel + 1) printString.
