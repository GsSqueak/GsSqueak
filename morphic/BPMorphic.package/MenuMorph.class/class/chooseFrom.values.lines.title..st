utilities
chooseFrom: aList values: valueList lines: linesArray title: queryString
  "Choose an item from the given list. Answer the index of the selected
	item. "

  "MenuMorph
	chooseFrom: #('Hello' 'World' 'Here' 'We' 'Go')
	values: #('Hello' 'World' 'Here' 'We' 'Go')
	lines: #(2 4)
	title: 'What''s up?'"

  | _gsSqueakTemp_menu _gsSqueakTemp_aBlock _gsSqueakTemp_result |
  (ProvideAnswerNotification signal: queryString)
    ifNotNil: [ :answer | 
      1 to: aList size do: [ :i | 
        (aList at: i) = answer
          ifTrue: [ ^ answer ] ].
      ^ nil ].
  _gsSqueakTemp_aBlock := [ :v | _gsSqueakTemp_result := v ].
  _gsSqueakTemp_menu := self new.
  _gsSqueakTemp_menu addTitle: queryString.
  1 to: aList size do: [ :i | 
    _gsSqueakTemp_menu
      add: (aList at: i) asString
      target: _gsSqueakTemp_aBlock
      selector: #'value:'
      argument: (valueList at: i).
    (linesArray includes: i)
      ifTrue: [ _gsSqueakTemp_menu addLine ] ].
  MenuIcons decorateMenu: _gsSqueakTemp_menu.
  _gsSqueakTemp_result := nil.
  _gsSqueakTemp_menu
    invokeAt: (SessionTemps current at: #'ActiveHand') position
    in: (SessionTemps current at: #'ActiveWorld')
    allowKeyboard: true.
  ^ _gsSqueakTemp_result