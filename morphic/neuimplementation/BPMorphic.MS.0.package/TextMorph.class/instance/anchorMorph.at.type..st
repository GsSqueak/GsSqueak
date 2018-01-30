anchors
anchorMorph: aMorph at: aPoint type: anchorType 
	| _gsSqueakTemp_relPt _gsSqueakTemp_index _gsSqueakTemp_newText _gsSqueakTemp_block |
	aMorph owner == self
		ifTrue: [self removeMorph: aMorph].
	aMorph textAnchorType: nil.
	aMorph relativeTextAnchorPosition: nil.
	self addMorphFront: aMorph.
	aMorph textAnchorType: anchorType.
	aMorph relativeTextAnchorPosition: nil.
	anchorType == #document
		ifTrue: [^ self].
	_gsSqueakTemp_relPt := self transformFromWorld globalPointToLocal: aPoint.
	_gsSqueakTemp_index := (self paragraph characterBlockAtPoint: _gsSqueakTemp_relPt) stringIndex.
	_gsSqueakTemp_newText := Text
				string: (String value: 1)
				attribute: (TextAnchor new anchoredMorph: aMorph).
	anchorType == #inline
		ifTrue: [self paragraph
				replaceFrom: _gsSqueakTemp_index
				to: _gsSqueakTemp_index - 1
				with: _gsSqueakTemp_newText
				displaying: false]
		ifFalse: [_gsSqueakTemp_index := _gsSqueakTemp_index min: paragraph text size.
			_gsSqueakTemp_index := paragraph text string
						lastIndexOf: Character cr
						startingAt: _gsSqueakTemp_index
						ifAbsent: [0].
			_gsSqueakTemp_block := paragraph characterBlockForIndex: _gsSqueakTemp_index + 1.
			aMorph relativeTextAnchorPosition: _gsSqueakTemp_relPt x - bounds left @ (_gsSqueakTemp_relPt y - _gsSqueakTemp_block top).
			self paragraph
				replaceFrom: _gsSqueakTemp_index + 1
				to: _gsSqueakTemp_index
				with: _gsSqueakTemp_newText
				displaying: false].
	self fit