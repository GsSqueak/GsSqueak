instance creation
openOn: aFormDictionary withLabel: aLabel
	"open a graphical dictionary in a window having the label aLabel. 
     aFormDictionary should be a dictionary containing as value a form."

	| inst aWindow |
	aFormDictionary size isZero ifTrue: [^ self inform: 'Empty!' translated].	
	inst := self new initializeFor: nil fromDictionary: aFormDictionary.

	aWindow := (SystemWindow labelled: aLabel) model: inst.
	aWindow addMorph: inst frame: (0@0 extent: 1@1).
	aWindow extent: inst fullBounds extent + (3 @ aWindow labelHeight + 3);
		minimumExtent: inst minimumExtent + (3 @ aWindow labelHeight + 3).
	
     HandMorph attach: aWindow.

	^ inst