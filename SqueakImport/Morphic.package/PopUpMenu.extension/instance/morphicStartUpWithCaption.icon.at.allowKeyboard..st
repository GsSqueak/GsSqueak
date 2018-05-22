*Morphic-Menus
morphicStartUpWithCaption: captionOrNil icon: aForm at: location allowKeyboard: aBoolean
	"Display the menu, with caption if supplied. Wait for the mouse button to go down, then track the selection as long as the button is pressed. When the button is released,
	Answer the index of the current selection, or zero if the mouse is not released over  any menu item. Location specifies the desired topLeft of the menu body rectangle. The final argument indicates whether the menu should seize the keyboard focus in order to allow the user to navigate it via the keyboard."

	selection := Cursor normal
				showWhile: [| menuMorph |
					menuMorph := MVCMenuMorph from: self title: nil.
					(captionOrNil notNil
							or: [aForm notNil])
						ifTrue: [menuMorph addTitle: captionOrNil icon: aForm].
					MenuIcons decorateMenu: menuMorph.
					menuMorph
						invokeAt: location
						in: ActiveWorld
						allowKeyboard: aBoolean].
	^ selection