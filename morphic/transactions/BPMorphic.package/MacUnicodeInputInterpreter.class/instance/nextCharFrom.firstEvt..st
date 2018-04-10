keyboard
nextCharFrom: sensor firstEvt: evtBuf
  | _gsSqueakTemp_keyValue _gsSqueakTemp_mark |
  _gsSqueakTemp_keyValue := evtBuf at: 6.
  _gsSqueakTemp_mark := self japaneseSpecialMark: _gsSqueakTemp_keyValue.
  _gsSqueakTemp_mark notNil
    ifTrue: [ ^ _gsSqueakTemp_mark ].
  _gsSqueakTemp_keyValue < 256
    ifTrue: [ ^ Character value: _gsSqueakTemp_keyValue ].	"Smalltalk systemLanguage charsetClass charFromUnicode: keyValue."
  ^ Unicode value: _gsSqueakTemp_keyValue