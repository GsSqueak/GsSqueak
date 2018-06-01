actions & preps
polyNew: evt 
	"Create a new polygon. Add it to the sketch, and let the user drag
	its vertices around! Freeze it into the painting when the user chooses
	another tool."
	| _gsSqueakTemp_poly _gsSqueakTemp_cColor |
	self polyEditing
		ifTrue: [self polyFreeze.
			(self hasProperty: #polyCursor)
				ifTrue: [palette
						plainCursor: (self valueOfProperty: #polyCursor)
						event: evt.
					self removeProperty: #polyCursor].
			^ self].
	_gsSqueakTemp_cColor := self getColorFor: evt.
	self polyFreeze.
	"any old one we were working on"
	_gsSqueakTemp_poly := PolygonMorph new.
	"addHandles"
	_gsSqueakTemp_poly referencePosition: _gsSqueakTemp_poly bounds origin.
	_gsSqueakTemp_poly align: _gsSqueakTemp_poly bounds center with: evt cursorPoint.
	_gsSqueakTemp_poly borderWidth: (self getNibFor: evt) width.
	_gsSqueakTemp_poly
		borderColor: (_gsSqueakTemp_cColor isTransparent
				ifTrue: [Color black]
				ifFalse: [_gsSqueakTemp_cColor]).
	_gsSqueakTemp_poly color: Color transparent.
	self addMorph: _gsSqueakTemp_poly.
	_gsSqueakTemp_poly changed.
	self setProperty: #polygon toValue: _gsSqueakTemp_poly