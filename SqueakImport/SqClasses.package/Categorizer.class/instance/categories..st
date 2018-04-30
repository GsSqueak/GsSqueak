accessing
categories: anArray
	"Reorder my categories to be in order of the argument, anArray. If the 
	resulting organization does not include all elements, then give an error."

	| newCategories newStops newElements catName list runningTotal | 
	
	anArray size < 2 ifTrue: [ ^ self ].
	
	newCategories := Array new: anArray size.
	newStops := Array new: anArray size.
	newElements := Array new: 0.
	runningTotal := 0.
	1 to: anArray size do:
		[:i |
		catName := (anArray at: i) asSymbol.
		list := self listAtCategoryNamed: catName.
				newElements := newElements, list.
				newCategories at: i put: catName.
				newStops at: i put: (runningTotal := runningTotal + list size)].
	elementArray do:
		[:element | "check to be sure all elements are included"
		(newElements includes: element)
			ifFalse: [^self error: 'New categories must match old ones']].
	"Everything is good, now update my three arrays."
	categoryArray := newCategories.
	categoryStops := newStops.
	elementArray := newElements