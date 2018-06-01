private
removedMorph: aMorph 
	| _gsSqueakTemp_range |
	_gsSqueakTemp_range := text
				find: (TextAnchor new anchoredMorph: aMorph).
	_gsSqueakTemp_range
		ifNotNil: [self paragraph
				replaceFrom: _gsSqueakTemp_range first
				to: _gsSqueakTemp_range last
				with: Text new
				displaying: false.
			self fit].
	aMorph textAnchorType: nil.
	aMorph relativeTextAnchorPosition: nil.
	super removedMorph: aMorph