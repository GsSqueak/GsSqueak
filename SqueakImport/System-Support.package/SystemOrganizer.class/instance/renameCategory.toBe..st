accessing
renameCategory: oldCatString toBe: newCatString
	| r |
	r := super renameCategory: oldCatString toBe: newCatString.
	self == SystemOrganization ifTrue: [
		SystemChangeNotifier uniqueInstance 
			classCategoryRenamedFrom: oldCatString to: newCatString].
	^ r