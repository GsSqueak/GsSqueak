accessing
removeCategory: cat 
	| r |
	r := super removeCategory: cat.
	self == SystemOrganization
		ifTrue: [SystemChangeNotifier uniqueInstance classCategoryRemoved: cat].
	^ r