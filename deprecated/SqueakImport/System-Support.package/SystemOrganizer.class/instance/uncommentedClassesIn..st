query
uncommentedClassesIn: categoryName

	"SystemOrganization uncommentedClassesIn: 'Morphic*'"

	| classes |
	classes := OrderedCollection new.
	self categories withIndexCollect: [:cat :idx |
		(categoryName match: cat)
			ifTrue: [classes addAll: (self listAtCategoryNumber: idx)]
			ifFalse: [nil]].
	^ (classes collect: [:clsName | Smalltalk at: clsName]
		thenSelect: [:cls | cls hasComment not]) asArray
