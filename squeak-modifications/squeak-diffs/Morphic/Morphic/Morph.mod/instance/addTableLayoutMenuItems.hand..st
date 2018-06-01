layout-menu
addTableLayoutMenuItems: aMenu hand: aHand
	| menu sub |
	menu := MenuMorph new defaultTarget: self.
	menu addUpdating: #hasReverseCellsString action: #changeReverseCells.
	menu addUpdating: #hasClipLayoutCellsString action: #changeClipLayoutCells.
	menu addUpdating: #hasRubberBandCellsString action: #changeRubberBandCells.
	menu addLine.
	menu add: 'change cell inset...' translated action: #changeCellInset:.
	menu add: 'change min cell size...' translated action: #changeMinCellSize:.
	menu add: 'change max cell size...' translated action: #changeMaxCellSize:.
	menu addLine.

	sub := MenuMorph new defaultTarget: self.
	#(leftToRight rightToLeft topToBottom bottomToTop) do:[:sym|
		sub addUpdating: #listDirectionString: target: self selector: #changeListDirection: argumentList: (Array with: sym)].
	menu add: 'list direction' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(none leftToRight rightToLeft topToBottom bottomToTop) do:[:sym|
		sub addUpdating: #wrapDirectionString: target: self selector: #wrapDirection: argumentList: (Array with: sym)].
	menu add: 'wrap direction' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(center topLeft topRight bottomLeft bottomRight topCenter leftCenter rightCenter bottomCenter) do:[:sym|
		sub addUpdating: #cellPositioningString: target: self selector: #cellPositioning: argumentList: (Array with: sym)].
	menu add: 'cell positioning' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(topLeft bottomRight center justified) do:[:sym|
		sub addUpdating: #listCenteringString: target: self selector: #listCentering: argumentList: (Array with: sym)].
	menu add: 'list centering' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(topLeft bottomRight center justified) do:[:sym|
		sub addUpdating: #wrapCenteringString: target: self selector: #wrapCentering: argumentList: (Array with: sym)].
	menu add: 'wrap centering' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(none equal) do:[:sym|
		sub addUpdating: #listSpacingString: target: self selector: #listSpacing: argumentList: (Array with: sym)].
	menu add: 'list spacing' translated subMenu: sub.

	sub := MenuMorph new defaultTarget: self.
	#(none localRect localSquare globalRect globalSquare) do:[:sym|
		sub addUpdating: #cellSpacingString: target: self selector: #cellSpacing: argumentList: (Array with: sym)].
	menu add: 'cell spacing' translated subMenu: sub.

	aMenu ifNotNil:[aMenu add: 'table layout' translated subMenu: menu].
	^menu