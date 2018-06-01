alphabetic
alphabeticTabs
	"Answer a list of buttons which, when hit, will trigger the choice of a morphic category"

	| buttonList tabLabels |

	self flag: #todo. "includes non-english characters"
	tabLabels := (($a to: $z) asOrderedCollection collect: [:ch | ch asString]) .

	buttonList := tabLabels collect:
		[:catName |
			| aButton |
			aButton := SimpleButtonMorph new label: catName.
			aButton actWhen: #buttonDown.
			aButton target: self; actionSelector: #showAlphabeticCategory:fromButton:; arguments: {catName. aButton}].
	^ buttonList

"ObjectsTool new tabsForMorphicCategories"