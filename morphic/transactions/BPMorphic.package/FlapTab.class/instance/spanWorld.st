positioning
spanWorld
	| _gsSqueakTemp_container _gsSqueakTemp_area |
	_gsSqueakTemp_container := self pasteUpMorph
				ifNil: [self currentWorld].
	_gsSqueakTemp_area := _gsSqueakTemp_container clearArea.
	self orientation == #vertical
		ifTrue: [referent vResizing == #rigid
				ifTrue: [referent height: _gsSqueakTemp_area height].
			referent hResizing == #rigid
				ifTrue: [referent
						width: (referent width min: _gsSqueakTemp_area width - self width)].
			referent top: _gsSqueakTemp_area top.
			referent
				bottom: (_gsSqueakTemp_area bottom min: referent bottom)]
		ifFalse: [referent hResizing == #rigid
				ifTrue: [referent width: _gsSqueakTemp_area width].
			referent vResizing == #rigid
				ifTrue: [referent
						height: (referent height min: _gsSqueakTemp_area height - self height)].
			referent left: _gsSqueakTemp_area left.
			referent
				right: (_gsSqueakTemp_area right min: referent right)]