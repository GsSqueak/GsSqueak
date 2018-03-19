menu
setActWhen
	| _gsSqueakTemp_selections |
	_gsSqueakTemp_selections := #(#buttonDown #buttonUp #whilePressed #startDrag ).
	actWhen := UIManager default
				chooseFrom: (_gsSqueakTemp_selections
						collect: [:t | t translated])
				values: _gsSqueakTemp_selections
				title: 'Choose one of the following conditions' translated