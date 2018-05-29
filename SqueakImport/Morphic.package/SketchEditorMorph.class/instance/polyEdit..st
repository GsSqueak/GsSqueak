actions & preps
polyEdit: evt
	"Add handles and let user drag'em around"
	| poly |
	poly := self valueOfProperty: #polygon.
	poly ifNil:[^self].
	poly addHandles.
	self polyEditing: true.
	self setProperty: #polyCursor toValue: palette plainCursor.
	palette plainCursor: Cursor normal event: evt.