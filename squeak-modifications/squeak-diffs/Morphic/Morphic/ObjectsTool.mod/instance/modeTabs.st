major modes
modeTabs
	"Answer a list of buttons which, when hit, will trigger the choice of mode of the receiver"

	| buttonList tupleList |
	tupleList :=  #(
		('alphabetic'		alphabetic	showAlphabeticTabs	'A separate tab for each letter of the alphabet')
		('find'				search			showSearchPane			'Provides a type-in pane allowing you to match')
		('categories'		categories	showCategories			'Grouped by category')

		"('standard'		standard		showStandardPane		'Standard Squeak tools supplies for building')"
	).
				
	buttonList := tupleList collect:
		[:tuple |
			| aButton |
			aButton := SimpleButtonMorph new label: tuple first translated.
			aButton actWhen: #buttonUp.
			aButton setProperty: #modeSymbol toValue: tuple second.
			aButton target: self; actionSelector: tuple third.
			aButton setBalloonText: tuple fourth translated.
			aButton borderWidth: 0.
			aButton].
	^ buttonList

"ObjectsTool new modeTabs"