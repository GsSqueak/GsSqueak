event handling
mouseEnterDragging: evt 
	| _gsSqueakTemp_aMorph |
	(evt hand hasSubmorphs
			and: [self dropEnabled])
		ifFalse: ["no d&d"
			^ super mouseEnterDragging: evt].
	(self wantsDroppedMorph: evt hand firstSubmorph event: evt)
		ifTrue: [_gsSqueakTemp_aMorph := self itemFromPoint: evt position.
			_gsSqueakTemp_aMorph
				ifNotNil: [self potentialDropMorph: _gsSqueakTemp_aMorph].
			evt hand newMouseFocus: self]