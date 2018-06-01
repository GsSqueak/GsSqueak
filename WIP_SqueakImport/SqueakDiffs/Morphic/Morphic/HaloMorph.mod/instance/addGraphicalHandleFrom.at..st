private
addGraphicalHandleFrom: formKey at: aPoint
	"Add the supplied form as a graphical handle centered at the given point.  Return the handle."
	| handle aForm |
	aForm := (ScriptingSystem formAtKey: formKey) ifNil: [ScriptingSystem formAtKey: #SolidMenu].
	handle := ImageMorph new image: aForm; bounds: (Rectangle center: aPoint extent: aForm extent).
	handle wantsYellowButtonMenu: false.
	self addMorph: handle.
	handle on: #mouseUp send: #endInteraction: to: self.
	^ handle
