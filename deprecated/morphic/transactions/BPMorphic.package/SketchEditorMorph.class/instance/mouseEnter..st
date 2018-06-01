event handling
mouseEnter: evt 
	"Set the cursor. Reread colors if embedded editable polygon needs it."
	| _gsSqueakTemp_poly _gsSqueakTemp_cColor |
	super mouseEnter: evt.
	(self get: #action for: evt)
			== #scaleOrRotate
		ifTrue: [self
				set: #action
				for: evt
				to: (self get: #priorAction for: evt)].
	"scale and rotate are not real modes. If we enter with one, wear the
	previous tool."
	evt hand
		showTemporaryCursor: (self getCursorFor: evt).
	palette getSpecial == #polygon:
		ifFalse: [^ self].
	(_gsSqueakTemp_poly := self valueOfProperty: #polygon)
		ifNil: [^ self].
	_gsSqueakTemp_cColor := self getColorFor: evt.
	_gsSqueakTemp_poly borderColor: _gsSqueakTemp_cColor;
		 borderWidth: (self getNibFor: evt) width.
	_gsSqueakTemp_poly changed