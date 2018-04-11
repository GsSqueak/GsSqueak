menu commands
offerMenuFromEsc: aKeyboardEvent
  "The escape key was hit while the receiver has the keyboard focus;
	take action"

  (SessionTemps current at: #'ActiveEvent') shiftPressed
    ifFalse: [ self raiseContextMenu: aKeyboardEvent ].
  ^ true