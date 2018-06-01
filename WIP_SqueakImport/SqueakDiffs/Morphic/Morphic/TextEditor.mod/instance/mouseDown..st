events
mouseDown: evt 
	"Either 1) handle text actions in the paragraph, 2) begin a text drag operation, or 3) modify the caret/selection."
	
	| clickPoint b |

	oldInterval := self selectionInterval.
	clickPoint := evt cursorPoint.
	b := paragraph characterBlockAtPoint: clickPoint.

	(paragraph clickAt: clickPoint for: model controller: self) ifTrue: [
		markBlock := b.
		pointBlock := b.
		evt hand releaseKeyboardFocus: morph.
		evt hand releaseMouseFocus: morph.
		^ self ].
	
	(morph dragEnabled and: [self isEventInSelection: evt]) ifTrue: [
		evt hand
			waitForClicksOrDrag: morph
			event: evt
			selectors: {#click:. nil. nil. #startDrag:}
			threshold: HandMorph dragThreshold.
		morph setProperty: #waitingForTextDrag toValue: true.
		^ self].
	
	evt shiftPressed
		ifFalse: [
			self closeTypeIn.
			markBlock := b.
			pointBlock := b ]
		 ifTrue: [
			self closeTypeIn.
			self mouseMove: evt ].
       self storeSelectionInParagraph