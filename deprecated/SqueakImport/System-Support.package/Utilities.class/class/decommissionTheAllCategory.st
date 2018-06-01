miscellaneous
decommissionTheAllCategory
	"Utilities decommissionTheAllCategory"
	"Moves all methods that are in a category named 'all' into the default 'as yet unclassified' category"

	| methodCount classCount |
	self flag: #ShouldBeMovedIntoClassOrganization. "sd"
	methodCount := 0.
	classCount := 0.
	self systemNavigation allBehaviorsDo:
		[:aClass | | org any | org := aClass organization.
			any := false.
			aClass selectorsDo:
				[:aSelector | | aCategory |
					aCategory := org categoryOfElement: aSelector.
					aCategory = #all ifTrue:
						[org classify: aSelector under: ClassOrganizer default suppressIfDefault: false.
						methodCount := methodCount + 1.
						any := true]].
			any ifTrue: [classCount := classCount + 1].
			org removeEmptyCategories].
	Transcript cr; show: methodCount printString, ' methods in ', classCount printString, ' classes moved
from "all" to "as yet unclassified"'
