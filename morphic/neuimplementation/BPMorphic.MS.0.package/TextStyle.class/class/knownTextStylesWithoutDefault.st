TextConstants access
knownTextStylesWithoutDefault
	"Answer the names of the known text styles, sorted in alphabetical
	order without default"
	"TextStyle knownTextStylesWithoutDefault"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self knownTextStyles asOrderedCollection.
	^ _gsSqueakTemp_result copyWithoutAll: self defaultFamilyNames