private-I/O
processKeyboardEvent: evt
  "process a keyboard event, updating EventSensor state"

  "Never update keyboardBuffer if we have an eventQueue active"

  | _gsSqueakTemp_charCode _gsSqueakTemp_pressCode |
  mouseButtons := (mouseButtons bitAnd: 7) bitOr: ((evt at: 5) bitShift: 3).
  self eventQueue ifNotNil: [ ^ self ].
  _gsSqueakTemp_charCode := evt at: 3.
  _gsSqueakTemp_charCode = nil
    ifTrue: [ ^ self ].	"extra characters not handled in MVC"
  _gsSqueakTemp_pressCode := evt at: 4.
  _gsSqueakTemp_pressCode = EventKeyChar
    ifFalse: [ ^ self ].	"key down/up not handled in MVC"	"mix in modifiers"
  _gsSqueakTemp_charCode := _gsSqueakTemp_charCode
    bitOr: ((evt at: 5) bitShift: 8).
  keyboardBuffer nextPut: _gsSqueakTemp_charCode