accessing
addCategory: catString before: nextCategory
	SystemChangeNotifier uniqueInstance
		doSilently: [super addCategory: catString before: nextCategory];
		protocolAdded: catString inClass: self subject