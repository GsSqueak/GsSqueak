TextConstants access
knownTextStyles
	"Answer the names of the known text styles, sorted in alphabetical order"

	"TextStyle knownTextStyles"
	^ (TextConstants select: [:thang | thang isKindOf: TextStyle]) keys asArray sort

