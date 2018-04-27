accessing
addCategory: catString before: nextCategory
	self == SystemOrganization 
		ifTrue: 
			[SystemChangeNotifier uniqueInstance
				doSilently: [super addCategory: catString before: nextCategory];
				classCategoryAdded: catString]
		ifFalse:
			[super addCategory: catString before: nextCategory]