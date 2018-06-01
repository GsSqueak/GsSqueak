file list menu
itemsForFile: fullName
	"Answer a list of services appropriate for a file of the given full name"
	| suffix |
	suffix := self class suffixOf: fullName.
	^ (self class itemsForFile: fullName) , (self myServicesForFile: fullName suffix: suffix)