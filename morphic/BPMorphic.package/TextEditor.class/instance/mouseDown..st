events
mouseDown: evt 
	"An attempt to break up the old processRedButton code into threee
	phases "
	| _gsSqueakTemp_clickPoint _gsSqueakTemp_b |
	oldInterval := self selectionInterval.
	_gsSqueakTemp_clickPoint := evt cursorPoint.
	_gsSqueakTemp_b := paragraph characterBlockAtPoint: _gsSqueakTemp_clickPoint.
	(paragraph
			clickAt: _gsSqueakTemp_clickPoint
			for: model
			controller: self)
		ifTrue: [markBlock := _gsSqueakTemp_b.
			pointBlock := _gsSqueakTemp_b.
			evt hand releaseKeyboardFocus: morph.
			evt hand releaseMouseFocus: morph.
			^ self].
	evt shiftPressed
		ifTrue: [self closeTypeIn.
			self mouseMove: evt]
		ifFalse: [self closeTypeIn.
			markBlock := _gsSqueakTemp_b.
			pointBlock := _gsSqueakTemp_b].
	self storeSelectionInParagraph