basic control sequence
startUpWithCaption: captionOrNil icon: aForm at: location
	"Display the menu, with caption if supplied. Wait for the mouse button to go down,
	then track the selection as long as the button is pressed. When the button is released, 
	answer the index of the current selection, or zero if the mouse is not released over 
	any menu item. Location specifies the desired topLeft of the menu body rectangle."

	^ self
			startUpWithCaption: captionOrNil
			icon: aForm
			at: location
			allowKeyboard: Preferences menuKeyboardControl
