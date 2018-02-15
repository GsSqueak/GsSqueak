event handling
mouseDown: evt 
	evt hand visible: true.
	"See if a stamp is being dropped into the trash. It is not held by the
	hand. "
	self findActivePaintBox
		ifNotNil: [:_gsSqueakTemp_paintBox | _gsSqueakTemp_paintBox getSpecial == #stamp:
				ifTrue: [_gsSqueakTemp_paintBox deleteCurrentStamp: evt.
					"throw away stamp..."
					self primaryHand showTemporaryCursor: nil.
					^ self]].
	"... and don't open trash"
	evt hand waitForClicksOrDrag: self event: evt