user interface
crossReference
	"Answer an Array of arrays of size 2 whose first element is a message selector in the receiver's method dictionary and whose second element is a set of all message selectors in the method dictionary whose methods send a message with that selector. Subclasses are not included."

	^self selectors asArray sort collect: [:x | Array
			with: (String with: Character cr), x 
			with: (self whichSelectorsReferTo: x)]

	"Point crossReference."
