private
addGraphicalHandleFrom: formKey at: aPoint 
	"Add the supplied form as a graphical handle centered at the given
	point. Return the handle."
	| _gsSqueakTemp_handle _gsSqueakTemp_aForm |
	_gsSqueakTemp_aForm := (ScriptingSystem formAtKey: formKey)
				ifNil: [ScriptingSystem formAtKey: #SolidMenu].
	_gsSqueakTemp_handle := ImageMorph new image: _gsSqueakTemp_aForm;
				
				bounds: (Rectangle center: aPoint extent: _gsSqueakTemp_aForm extent).
	_gsSqueakTemp_handle wantsYellowButtonMenu: false.
	self addMorph: _gsSqueakTemp_handle.
	_gsSqueakTemp_handle
		on: #mouseUp
		send: #endInteraction
		to: self.
	^ _gsSqueakTemp_handle