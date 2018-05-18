private
hasEntries
	"Return true if this directory has entries or false."
	"FileDirectory default hasEntries"

	^(self primLookupEntryIn: pathName asVmPathName index: 1) ~~ nil