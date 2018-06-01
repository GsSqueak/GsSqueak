start & finish
undo: evt 
	"revert to a previous state. "
	| _gsSqueakTemp_temp _gsSqueakTemp_pen |
	self flag: #bob.
	"what is undo in multihand environment?"
	undoBuffer
		ifNil: [^ Beeper beep].
	"nothing to go back to"
	(self valueOfProperty: #polygon)
		ifNotNil: [:_gsSqueakTemp_poly | 
			_gsSqueakTemp_poly delete.
			self setProperty: #polygon toValue: nil.
			self polyEditing: false.
			^ self].
	_gsSqueakTemp_temp := paintingForm.
	paintingForm := undoBuffer.
	undoBuffer := _gsSqueakTemp_temp.
	"can get back to what you had by undoing again"
	_gsSqueakTemp_pen := self get: #paintingFormPen for: evt.
	_gsSqueakTemp_pen
		ifNil: [^ Beeper beep].
	_gsSqueakTemp_pen setDestForm: paintingForm.
	formCanvas := paintingForm getCanvas.
	"used for lines, ovals, etc."
	formCanvas := formCanvas
				copyOrigin: self topLeft negated
				clipRect: (0 @ 0 extent: bounds extent).
	self render: bounds