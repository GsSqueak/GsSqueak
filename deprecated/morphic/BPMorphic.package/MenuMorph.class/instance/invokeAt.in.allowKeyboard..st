modal control
invokeAt: aPoint in: aWorld allowKeyboard: aBoolean 
	"Add this menu to the given world centered at the given point. Wait
	for the user to make a selection and answer it. The selection value
	returned is an integer in keeping with PopUpMenu, if the menu is
	converted from an MVC-style menu."
	"Details: This is invoked synchronously from the caller. In order to keep
	processing inputs and updating the screen while waiting for the user
	to respond, this method has its own version of the World's event loop."
	| _gsSqueakTemp_w _gsSqueakTemp_originalFocusHolder |
	_gsSqueakTemp_originalFocusHolder := aWorld primaryHand keyboardFocus.
	self
		popUpAt: aPoint
		forHand: aWorld primaryHand
		in: aWorld
		allowKeyboard: aBoolean.
	_gsSqueakTemp_w := aWorld outermostWorldMorph.
	"containing hand"
	[self isInWorld]
		whileTrue: [_gsSqueakTemp_w doOneSubCycle].
	self delete.
	_gsSqueakTemp_originalFocusHolder
		ifNotNil: [aWorld primaryHand newKeyboardFocus: _gsSqueakTemp_originalFocusHolder]