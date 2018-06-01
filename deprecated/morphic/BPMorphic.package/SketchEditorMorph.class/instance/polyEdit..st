actions & preps
polyEdit: evt 
	"Add handles and let user drag'em around"
	| _gsSqueakTemp_poly |
	_gsSqueakTemp_poly := self valueOfProperty: #polygon.
	_gsSqueakTemp_poly
		ifNil: [^ self].
	_gsSqueakTemp_poly addHandles.
	self polyEditing: true.
	self setProperty: #polyCursor toValue: palette plainCursor.
	palette plainCursor: Cursor normal event: evt