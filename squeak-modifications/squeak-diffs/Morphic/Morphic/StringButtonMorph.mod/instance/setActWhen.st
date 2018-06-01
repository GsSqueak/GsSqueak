menu
setActWhen

	| selections |
	selections := #(buttonDown buttonUp whilePressed).
	actWhen := UIManager default 
		chooseFrom: (selections collect: [:t | t translated]) 
		values: selections
		title: 'Choose one of the following conditions' translated.
