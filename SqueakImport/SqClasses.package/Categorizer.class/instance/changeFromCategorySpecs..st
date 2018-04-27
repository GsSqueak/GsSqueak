accessing
changeFromCategorySpecs: categorySpecs 
	"Tokens is an array of categorySpecs as scanned from a browser 'reorganize' pane, or built up by some other process, such as a scan of an environment."

	| newCategories newStops cc currentStop oldElements newElements |
	oldElements := elementArray asSet.
	newCategories := Array new: categorySpecs size.
	newStops := Array new: categorySpecs size.
	currentStop := 0.
	newElements := WriteStream on: (Array new: 16).
	1 to: categorySpecs size do: 
		[:i | | catSpec |
		catSpec := categorySpecs at: i.
		newCategories at: i put: catSpec first asSymbol.
		catSpec allButFirst
			replace: [ :each | 
				each isSymbol
					ifTrue: [each]
					ifFalse: [each printString asSymbol ] ];
			sort;
			do: [ :elem |
				(oldElements remove: elem ifAbsent: nil) ifNotNil: [
					newElements nextPut: elem.
					currentStop := currentStop+1]].
		newStops at: i put: currentStop].

	"Ignore extra elements but don't lose any existing elements!"
	oldElements := oldElements collect:
		[:elem | Array with: (self categoryOfElement: elem) with: elem].
	newElements := newElements contents.
	categoryArray := newCategories.
	(cc := categoryArray asSet) size = categoryArray size ifFalse: ["has duplicate element"
		| uniqueElements |
		uniqueElements := cc copy.
		categoryArray withIndexDo: [ :dup :ii |
			uniqueElements remove: dup ifAbsent: [ "real duplicate"
				| dup2 num | 
				num := 2.
				[dup2 := (dup,' #', num printString) asSymbol.  cc includes: dup2] whileTrue: [num := num + 1].
				cc add: dup2.
				categoryArray at: ii put: dup2 ] ] ].
	categoryStops := newStops.
	elementArray := newElements.
	oldElements do: [:pair | self classify: pair last under: pair first].