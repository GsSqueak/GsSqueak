private events
generateKeyboardEvent: evtBuf
  "Generate the appropriate mouse event for the given raw event buffer"

  | _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_type _gsSqueakTemp_pressType _gsSqueakTemp_stamp _gsSqueakTemp_keyValue |
  _gsSqueakTemp_stamp := evtBuf second.
  _gsSqueakTemp_stamp = 0
    ifTrue: [ _gsSqueakTemp_stamp := Time eventMillisecondClock ].
  _gsSqueakTemp_pressType := evtBuf fourth.
  _gsSqueakTemp_pressType = EventKeyDown
    ifTrue: [ _gsSqueakTemp_type := #'keyDown' ].
  _gsSqueakTemp_pressType = EventKeyUp
    ifTrue: [ _gsSqueakTemp_type := #'keyUp' ].
  _gsSqueakTemp_pressType = EventKeyChar
    ifTrue: [ _gsSqueakTemp_type := #'keystroke' ].
  _gsSqueakTemp_modifiers := evtBuf fifth.
  _gsSqueakTemp_buttons := (_gsSqueakTemp_modifiers bitShift: 3)
    bitOr: (lastMouseEvent buttons bitAnd: 7).
  _gsSqueakTemp_type = #'keystroke'
    ifTrue: [ 
      _gsSqueakTemp_keyValue := (self keyboardInterpreter
        nextCharFrom: Sensor
        firstEvt: evtBuf) asInteger ]
    ifFalse: [ _gsSqueakTemp_keyValue := evtBuf third ].
  ^ KeyboardEvent new
    setType: _gsSqueakTemp_type
    buttons: _gsSqueakTemp_buttons
    position: self position
    keyValue: _gsSqueakTemp_keyValue
    hand: self
    stamp: _gsSqueakTemp_stamp