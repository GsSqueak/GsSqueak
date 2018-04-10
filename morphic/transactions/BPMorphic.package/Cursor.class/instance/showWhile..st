displaying
showWhile: aBlock
  "While evaluating the argument, aBlock, make the receiver be the
	cursor shape."

  "ar 2/2/2006: Only allow this if active process is ui process"

  | _gsSqueakTemp_oldcursor |
  "Processor activeProcess == Project uiProcess
		ifFalse: [^ aBlock value]."
  _gsSqueakTemp_oldcursor := Cursor currentCursor.
  self show.
  ^ aBlock
    ensure: [ _gsSqueakTemp_oldcursor show ]