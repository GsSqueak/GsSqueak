utilities
confirm: queryString trueChoice: trueChoice falseChoice: falseChoice
  "Put up a yes/no menu with caption queryString. The actual wording
	for the two choices will be as provided in the trueChoice and
	falseChoice parameters. Answer true if the response is the
	true-choice, false if it's the false-choice. This is a modal question -- the
	user must respond one way or the other."

  "MenuMorph 
	confirm: 'Are you hungry?' 
	trueChoice: 'yes, I''m famished' 
	falseChoice: 'no, I just ate'"

  | _gsSqueakTemp_menu _gsSqueakTemp_aBlock _gsSqueakTemp_result |
  (ProvideAnswerNotification signal: queryString)
    ifNotNil: [ :answer | ^ trueChoice = answer ].
  _gsSqueakTemp_aBlock := [ :v | _gsSqueakTemp_result := v ].
  _gsSqueakTemp_menu := self new.
  _gsSqueakTemp_menu addTitle: queryString icon: MenuIcons confirmIcon.
  _gsSqueakTemp_menu
    add: trueChoice
    target: _gsSqueakTemp_aBlock
    selector: #'value:'
    argument: true.
  _gsSqueakTemp_menu
    add: falseChoice
    target: _gsSqueakTemp_aBlock
    selector: #'value:'
    argument: false.
  MenuIcons decorateMenu: _gsSqueakTemp_menu.
  [ 
  _gsSqueakTemp_menu
    invokeAt: (SessionTemps current at: #'ActiveHand') position
    in: (SessionTemps current at: #'ActiveWorld')
    allowKeyboard: true.
  _gsSqueakTemp_result == nil ]
    whileTrue.
  ^ _gsSqueakTemp_result