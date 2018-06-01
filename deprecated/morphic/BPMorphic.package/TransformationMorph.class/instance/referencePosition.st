geometry eToy
referencePosition
	"Answer the receiver's reference position, bullet-proofed against infinite
	recursion in the unlikely but occasionally-seen case that I am my own
	renderee "
	| _gsSqueakTemp_rendered |
	^ (_gsSqueakTemp_rendered := self renderedMorph) == self
		ifTrue: [super referencePosition]
		ifFalse: [transform localPointToGlobal: _gsSqueakTemp_rendered referencePosition]