actions & preps
polyNew: evt
	"Create a new polygon.  Add it to the sketch, and let the user drag
its vertices around!  Freeze it into the painting when the user chooses
another tool."

	| poly cColor |
	self polyEditing ifTrue:[
		self polyFreeze.
		(self hasProperty: #polyCursor)
			ifTrue:[palette plainCursor: (self valueOfProperty: #polyCursor) event: evt.
					self removeProperty: #polyCursor].
		^self].
	cColor := self getColorFor: evt.
	self polyFreeze.		"any old one we were working on"
	poly := PolygonMorph new "addHandles".
	poly referencePosition: poly bounds origin.
	poly align: poly bounds center with: evt cursorPoint.
	poly borderWidth: (self getNibFor: evt) width.
	poly borderColor: (cColor isTransparent ifTrue: [Color black] ifFalse: [cColor]).
	poly color: Color transparent.
	self addMorph: poly.
	poly changed.
	self setProperty: #polygon toValue: poly.