actions & preps
polyFreeze
	"A live polygon is on the painting.  Draw it into the painting and
delete it."

	| poly |
	self polyEditing ifFalse:[^self].
	(poly := self valueOfProperty: #polygon)
		ifNil:
			[self polyEditing: false.
			^ self].
	poly drawOn: formCanvas.
	poly delete.
	self setProperty: #polygon toValue: nil.
	self polyEditing: false.