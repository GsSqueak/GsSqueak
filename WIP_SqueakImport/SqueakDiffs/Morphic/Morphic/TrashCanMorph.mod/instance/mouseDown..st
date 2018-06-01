event handling
mouseDown: evt
	| paintBox |
	evt hand visible: true.
	"See if a stamp is being dropped into the trash. It is not held by the hand."
	(paintBox := self findActivePaintBox) ifNotNil: [
		paintBox getSpecial == #stamp: ifTrue: [
			paintBox deleteCurrentStamp: evt.  "throw away stamp..."
			self primaryHand showTemporaryCursor: nil.
			^ self]].	  "... and don't open trash"
	evt hand waitForClicksOrDrag: self event: evt.
