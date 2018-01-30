accessing
removeCategory: cat 
	SystemChangeNotifier uniqueInstance
		doSilently: [super removeCategory: cat];
		protocolRemoved: cat inClass: self subject