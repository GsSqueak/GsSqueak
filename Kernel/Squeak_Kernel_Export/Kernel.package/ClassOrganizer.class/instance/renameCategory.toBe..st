accessing
renameCategory: oldCatString toBe: newCatString
	SystemChangeNotifier uniqueInstance
		doSilently: [super renameCategory: oldCatString toBe: newCatString];
		protocolRenamedFrom: oldCatString asSymbol to: newCatString asSymbol inClass: self subject.
	self logSelectorsInChangedCategory: newCatString.
