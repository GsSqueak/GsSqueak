actions & preps
polyFreeze
	"A live polygon is on the painting. Draw it into the painting and
	delete it."
	| _gsSqueakTemp_poly |
	self polyEditing
		ifFalse: [^ self].
	(_gsSqueakTemp_poly := self valueOfProperty: #polygon)
		ifNil: [self polyEditing: false.
			^ self].
	_gsSqueakTemp_poly drawOn: formCanvas.
	_gsSqueakTemp_poly delete.
	self setProperty: #polygon toValue: nil.
	self polyEditing: false