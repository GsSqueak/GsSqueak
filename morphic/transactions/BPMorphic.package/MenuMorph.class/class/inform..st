utilities
inform: queryString
  "MenuMorph inform: 'I like Squeak'"

  | _gsSqueakTemp_menu |
  (ProvideAnswerNotification signal: queryString) ifNotNil: [ :answer | ^ self ].
  _gsSqueakTemp_menu := self new.
  _gsSqueakTemp_menu addTitle: queryString icon: MenuIcons confirmIcon.
  _gsSqueakTemp_menu add: 'OK' target: self selector: #'yourself'.
  MenuIcons decorateMenu: _gsSqueakTemp_menu.
  _gsSqueakTemp_menu
    invokeAt: (SessionTemps current at: #'ActiveHand') position
    in: (SessionTemps current at: #'ActiveWorld')
    allowKeyboard: true