menus
addFillStyleMenuItems: aMenu hand: aHand
	"Add the items for changing the current fill style of the Morph"
	| menu |
	self canHaveFillStyles ifFalse:[^aMenu add: 'change color...' translated target: self action: #changeColor].
	menu := MenuMorph new defaultTarget: self.
	self fillStyle addFillStyleMenuItems: menu hand: aHand from: self.
	menu addLine.
	menu add: 'solid fill' translated action: #useSolidFill.
	menu add: 'gradient fill' translated action: #useGradientFill.
	menu add: 'bitmap fill' translated action: #useBitmapFill.
	menu add: 'default fill' translated action: #useDefaultFill.
	aMenu add: 'fill style' translated subMenu: menu.
	"aMenu add: 'change color...' translated action: #changeColor"