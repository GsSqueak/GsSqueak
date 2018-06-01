statistics
statisticsOfRefs
	"Analyze the information in references, the objects being written out"

	| parents ownerBags tallies n nm owners |
	parents := IdentityDictionary new: references size * 2.
	n := 0.
	'Finding Owners...'
	displayProgressFrom: 0 to: references size
	during: [:bar |
	references keysDo:
		[:parent | | kids |
		bar value: (n := n+1).
		kids := parent class isFixed
			ifTrue: [(1 to: parent class instSize) collect: [:i | parent
instVarAt: i]]
			ifFalse: [parent class isBits ifTrue: [Array new]
					 ifFalse: [(1 to: parent basicSize) collect: [:i | parent basicAt:
i]]].
		(kids select: [:x | references includesKey: x])
			do: [:child | parents at: child put: parent]]].
	ownerBags := Dictionary new.
	tallies := Bag new.
	n := 0.
	'Tallying Owners...'
	displayProgressFrom: 0 to: references size
	during: [:bar |
	references keysDo:  "For each class of obj, tally a bag of owner
classes"
		[:obj | | objParent | bar value: (n := n+1).
		nm := obj class name.
		tallies add: nm.
		owners := ownerBags at: nm ifAbsentPut: [Bag new].
		(objParent := parents at: obj ifAbsent: [nil]) == nil
			ifFalse: [owners add: objParent class name]]].
	^ String streamContents:
		[:strm |  tallies sortedCounts do:
			[:assn | n := assn key.  nm := assn value.
			owners := ownerBags at: nm.
			strm cr; nextPutAll: nm; space; print: n.
			owners size > 0 ifTrue:
				[strm cr; tab; print: owners sortedCounts]]]