event handling
mouseEnter: evt
	"Set the cursor.  Reread colors if embedded editable polygon needs it."

	| poly cColor |
	super mouseEnter: evt.
	(self get: #action for: evt) == #scaleOrRotate ifTrue: [
		self set: #action for: evt to: (self get: #priorAction for: evt).
		].	"scale and rotate are not real modes.  If we enter with one, wear the previous tool."
	evt hand showTemporaryCursor: (self getCursorFor: evt).
	palette getSpecial == #polygon: ifFalse: [^self].
	(poly := self valueOfProperty: #polygon) ifNil: [^ self].
	cColor := self getColorFor: evt.
	poly borderColor: cColor; borderWidth: (self getNibFor: evt) width.
	poly changed.