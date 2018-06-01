start & finish
undo: evt 
	"revert to a previous state.  "

	| temp poly pen |
	self flag: #bob.	"what is undo in multihand environment?"
	undoBuffer ifNil: [^Beeper beep].	"nothing to go back to"
	(poly := self valueOfProperty: #polygon) ifNotNil: 
			[poly delete.
			self setProperty: #polygon toValue: nil.
			self polyEditing: false.
			^self].
	temp := paintingForm.
	paintingForm := undoBuffer.
	undoBuffer := temp.	"can get back to what you had by undoing again"
	pen := self get: #paintingFormPen for: evt.
	pen ifNil: [^Beeper  beep].
	pen setDestForm: paintingForm.
	formCanvas := paintingForm getCanvas.	"used for lines, ovals, etc."
	formCanvas := formCanvas copyOrigin: self topLeft negated
				clipRect: (0 @ 0 extent: bounds extent).
	self render: bounds