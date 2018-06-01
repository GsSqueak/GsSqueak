categories
tabsForCategories
	"Answer a list of buttons which, when hit, will trigger the choice of a category"

	| buttonList classes categoryList basic |
	classes := Morph withAllSubclasses.
	categoryList := Set new.
	classes do: [:aClass |
		(aClass class includesSelector: #descriptionForPartsBin) ifTrue:
			[categoryList addAll: aClass descriptionForPartsBin translatedCategories].
		(aClass class includesSelector: #supplementaryPartsDescriptions) ifTrue:
			[aClass supplementaryPartsDescriptions do:
				[:aDescription | categoryList addAll: aDescription translatedCategories]]].

	categoryList := categoryList asOrderedCollection sort.
	
	basic := categoryList remove: ' Basic' translated ifAbsent: [ ].
	basic ifNotNil: [ categoryList addFirst: basic ].

	basic := categoryList remove: 'Basic' translated ifAbsent: [ ].
	basic ifNotNil: [ categoryList addFirst: basic ].

	buttonList := categoryList collect:
		[:catName |
			| aButton |
			aButton := SimpleButtonMorph new label: catName.
			aButton actWhen: #buttonDown.
			aButton target: self; actionSelector: #showCategory:fromButton:; arguments: {catName. aButton}].
	^ buttonList

"ObjectsTool new tabsForCategories"