system startup
startUp
	SystemChangeNotifier uniqueInstance
		notify: self default
		ofAllSystemChangesUsing: #event:.