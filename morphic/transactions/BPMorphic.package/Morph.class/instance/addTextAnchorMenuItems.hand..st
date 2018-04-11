text-anchor
addTextAnchorMenuItems: topMenu hand: aHand 
	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu addUpdating: #hasInlineAnchorString action: #changeInlineAnchor.
	aMenu addUpdating: #hasParagraphAnchorString action: #changeParagraphAnchor.
	aMenu addUpdating: #hasDocumentAnchorString action: #changeDocumentAnchor.
	topMenu
		ifNotNil: [topMenu add: 'text anchor' subMenu: aMenu].
	^ aMenu