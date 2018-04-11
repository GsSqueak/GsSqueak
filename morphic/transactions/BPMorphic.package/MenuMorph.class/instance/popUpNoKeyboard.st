control
popUpNoKeyboard
  "Present this menu in the current World, *not* allowing keyboard input
	into the menu"

  ^ self
    popUpAt: (SessionTemps current at: #'ActiveHand') position
    forHand: (SessionTemps current at: #'ActiveHand')
    in: (SessionTemps current at: #'ActiveWorld')
    allowKeyboard: false